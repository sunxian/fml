package cn.com.fml.mvc.controller;

import java.io.File;
import java.util.Iterator;
import java.util.UUID;
import java.util.logging.Logger;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;
import org.springframework.web.servlet.ModelAndView;

import cn.com.fml.mvc.dmo.TsAssets;
import cn.com.fml.mvc.service.intf.UploadFileService;


@Controller
@RequestMapping(value="/fileOperate")
public class UploadHandleController extends BaseController {
	
	private static final Logger LOG = Logger.getLogger(UploadHandleController.class.getName());
	
	//public static final String FILE_UPLOAD_PATH = "F:\\download";
	
	@Autowired
	private UploadFileService uploadFileService;
	
	private String makeFileName(String filename){  //2.jpg
        //为防止文件覆盖的现象发生，要为上传文件产生一个唯一的文件名
		String random = UUID.randomUUID().toString().replace("-", "");
        return random + "_" + filename;
    }
	
	private String makePath(String filename, String savePath){
        //得到文件名的hashCode的值，得到的就是filename这个字符串对象在内存中的地址
        int hashcode = filename.hashCode();
        int dir1 = hashcode&0xf;  //0--15
        int dir2 = (hashcode&0xf0)>>4;  //0-15
        //构造新的保存目录
        String dir = savePath + File.separator + dir1 + File.separator + dir2;  //upload\2\3  upload\3\5
        //File既可以代表文件也可以代表目录
        File file = new File(dir);
        //如果目录不存在
        if(!file.exists()){
            //创建目录
            file.mkdirs();
        }
        return dir;
    }
	
	@RequestMapping("/upload")
	public ModelAndView upload(HttpServletRequest request,HttpServletResponse response) throws Exception {
		LOG.info("文件上传开始");
	    ModelAndView view = new ModelAndView();

		//创建一个通用的多部分解析器
		CommonsMultipartResolver multipartResolver = new CommonsMultipartResolver(request.getSession().getServletContext());
		//判断 request 是否有文件上传,即多部分请求
		if(multipartResolver.isMultipart(request)){
			//转换成多部分request  
			MultipartHttpServletRequest multiRequest = (MultipartHttpServletRequest)request;
			//取得request中的所有文件名
			Iterator<String> iter = multiRequest.getFileNames();
			while(iter.hasNext()){
				TsAssets assets = new TsAssets();
				//取得上传文件
				MultipartFile file = multiRequest.getFile(iter.next());
				if(file != null){
					//取得当前上传文件的文件名称
					String myFileName = file.getOriginalFilename();
					//如果名称不为"",说明该文件存在，否则说明该文件不存在
					if(myFileName.trim() != "") {
						System.out.println(myFileName);
						//重命名上传后的文件名
						String fileName = makeFileName(file.getOriginalFilename());
						//定义上传路径
						String fileUploadPath = getValueFromProperties("file_upload_path");
						String path = makePath(fileName, fileUploadPath);
						File localFile = new File(path + File.separator + fileName);
						file.transferTo(localFile);
						assets.setFileName(fileName);
						assets.setStorePath(path);
						assets.setFileSize(file.getSize());
						String imageUrl = ""; 
						assets.setImageUrl(imageUrl);
						uploadFileService.saveTsAssets(assets);
						view.addObject("message", "文件上传成功");
					}
				}
			}
		}
		LOG.info("文件上传结束");
        view.setViewName("/uploadFile/uploadResult");
        return view;
	}
	
	@RequestMapping("/toUpload"	) 
	public String toUpload() {
		return "/uploadFile/upload";
	}
}
