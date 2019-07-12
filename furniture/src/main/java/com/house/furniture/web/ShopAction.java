package com.house.furniture.web;

import java.io.File;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.house.furniture.bean.Cart;
import com.house.furniture.bean.Category;
import com.house.furniture.bean.Product;
import com.house.furniture.bean.User;
import com.house.furniture.service.CartService;
import com.house.furniture.service.CategoryService;
import com.house.furniture.service.ImageService;
import com.house.furniture.service.ProductService;
import com.house.furniture.util.MyUtils;
import com.house.furniture.vo.EasyUIPage;
import com.house.furniture.vo.Result;

@Controller
@SessionAttributes(names= {"cartProductList","allSum"})
public class ShopAction {
	
	@Value("${spring.resources.staticLocations}")
	String staticLocations;
	
	@Autowired
	CategoryService categoryService;
	
	@Autowired
	ProductService productService;
	
	@Autowired
	CartService cartservice;
	
	@Autowired
	ImageService imageService;
	
	@ModelAttribute		//所有类别
	public void initParam(Model model) {
		System.err.println(staticLocations);
		List<Category> categoryList = categoryService.listAllCategory();
		model.addAttribute("categoryList", categoryList);
	}
	
	@RequestMapping(value = "shop")
	public String shop(@RequestParam(value = "cid", defaultValue = "1") int cid, Model model,
			@RequestParam(value = "page", defaultValue = "1") int page,
			@RequestParam(value = "size", defaultValue = "15") int size) {
		PageHelper.startPage(page, size);
		List<Product> productList = productService.listProductsByType(cid, page, size);		
		model.addAttribute("result", new Result(page, size, productList, productService.getProductSize(cid)));
		return "shop";
	}
	
	/**
	 * 根据条件查询对应的产品
	 * @param condition
	 * @param model
	 * @return
	 */
	@GetMapping(value = "condition.do")
	public String selectByCondition(@RequestParam(value = "condition", defaultValue = "") String condition, 
			Model model,@RequestParam(value = "page", defaultValue = "1") int page,
			@RequestParam(value = "size", defaultValue = "15") int size) {
//		PageHelper.startPage(page, size);
		List<Product> productList = productService.listProductByCondition(condition);		
		model.addAttribute("result", new Result(page, size, productList, productService.getConditionSize(condition)));
		return "shop";
	}
	
	@GetMapping(value = "item.do") 
	@ResponseBody
	public Result selectProductByItem(@RequestParam(value = "onSale", required = false) String onSale, 
			@RequestParam(value = "newProduct", required = false) String newProduct,
			@RequestParam(value = "min", defaultValue = "1") double min, 
			@RequestParam(value = "max", defaultValue = "20000") double max, 
			@RequestParam(value = "cid") int cid,
			@RequestParam(value = "page", defaultValue = "1") int page,
			@RequestParam(value = "size", defaultValue = "15") int size) {
		PageHelper.startPage(page, size);
		List<Product> productList = productService.listProductByItem(onSale, newProduct, min, max, cid);		
		return new Result(Result.EXECUTION_SUCCESS, 
			"", page, size, productList, productService.getItemSize(onSale, newProduct, min, max, cid));
	}
	
	@GetMapping(value = "quickView.do")
	@ResponseBody
	public Result getProductById(int pid) {
		Product product = productService.getProductById(pid);
		if (product == null) {
			return new Result(Result.EXECUTION_FAILED, "该产品不存在");
		} else {
			return new Result(Result.EXECUTION_SUCCESS, "", product);
		}
	}
	
	@GetMapping("addCart")
	@ResponseBody
	public Result addCart(Cart cart,@SessionAttribute("user") User user,Model model) {
		cart.setUid(user.getId());
		cart = cartservice.addCart(cart);
		if(cart.getProduct()==null) {
			Product product = productService.getProductById(cart.getPid());
			cart.setProduct(product);
		}
		List<Cart> cartProductList = cartservice.listCartProductByUser(user);
		model.addAttribute("cartProductList", cartProductList);
		long allSum=0;
		if(cartProductList.size()>0) {
			for (Cart c : cartProductList) {
				allSum+=c.getCount()*c.getProduct().getPrice();
			}
		}
		model.addAttribute("allSum", allSum);
		return new Result(Result.EXECUTION_SUCCESS,"加入购物车成功",cart);
	}
	
	@PostMapping("uploadImages.do")
	@ResponseBody
	public Result uploadImage(@RequestParam("file") MultipartFile file) {

		if (file.getSize()  == 0) {
			return new Result(Result.EXECUTION_CANCEL, "取消上传");
		}
		String filename = UUID.randomUUID().toString() + file.getOriginalFilename();		
		try {
			file.transferTo(new File("D:/PIAimages/head/" + filename));
			return new Result(Result.EXECUTION_SUCCESS, "文件上传成功", "/head/" + filename);
		} catch(Exception e) {
			return new Result(Result.EXECUTION_FAILED, "文件上传失败");
		}
	}
	
	@PostMapping("saveProduct.do")
	@ResponseBody
	public Result saveProduct(Product product, String[] uploads, String cid) {
		try {
			productService.saveProduct(product, uploads);
			return new Result(Result.EXECUTION_SUCCESS, "上传成功");
		} catch(Exception e) {
			return new Result(Result.EXECUTION_FAILED, "上传失败");
		}
		
	}
	
	@PostMapping("listAllProductByPage.do")
	@ResponseBody
	public EasyUIPage listAllProductByPage(int page, int rows, Product product) {
		Page<Product> pageList = productService.listAllProductByPage(page, rows, product);
		return new EasyUIPage(pageList.getTotal(), pageList.getResult());
	}
	
	@PostMapping("updateProduct.do")
	@ResponseBody
	public Result updateProduct(Product product, String[] uploads) {
		try {
			productService.updateProduct(product, uploads);
			return new Result(Result.EXECUTION_SUCCESS, "修改成功");
		} catch(Exception e) {
			return new Result(Result.EXECUTION_FAILED, "修改失败");
		}
		
	}
	
	@PostMapping("removeProduct.do")
	@ResponseBody
	public Result removeProduct(int pid) {
		try {
			productService.removeProduct(pid);
			return new Result(Result.EXECUTION_SUCCESS, "下架成功");
		} catch(Exception e) {
			return new Result(Result.EXECUTION_FAILED, "下架失败");
		}		
	}
	
	@PostMapping("uploadProduct.do")
	@ResponseBody
	public Result uploadProduct(int pid) {
		try {
			productService.uploadProduct(pid);
			return new Result(Result.EXECUTION_SUCCESS, "上架成功");
		} catch(Exception e) {
			return new Result(Result.EXECUTION_FAILED, "上架失败");
		}		
	}
	@GetMapping("delateImage.do")
	@ResponseBody
	public Result delateImage(String filename) {
		File file = new File(MyUtils.parseDirect(staticLocations) + MyUtils.parseFileName(filename));
		boolean delete = file.delete();
		if (delete) {
			return new Result(Result.EXECUTION_SUCCESS, "删除成功");
		} else {
			return new Result(Result.EXECUTION_FAILED, "删除失败");
		}
	}
	
	@GetMapping("removeImage.do")
	@ResponseBody
	public Result removeImage(int imgid) {
		try {
			imageService.removeImage(imgid);
			return new Result(Result.EXECUTION_SUCCESS, "删除成功");
		} catch(Exception e) {
			return new Result(Result.EXECUTION_FAILED, "删除失败");
		}		
	}
}
