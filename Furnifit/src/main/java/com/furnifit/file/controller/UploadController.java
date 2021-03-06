package com.furnifit.file.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.UUID;

import javax.annotation.Resource;

import org.apache.commons.io.IOUtils;
import org.apache.log4j.Logger;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.furnifit.common.web.MediaUtils;
import com.furnifit.common.web.UploadFileUtils;

@Controller
public class UploadController {

	private static final Logger logger=Logger.getLogger(UploadController.class);
	
	@Resource(name = "productImgPath")
	private String productImgPath;
	
	@Resource(name = "articleImgPath")
	private String articleImgPath;
	
	
	@RequestMapping(value="/uploadForm",  method = RequestMethod.GET)
	public void uploadForm() {
	}

	@RequestMapping(value="/uploadForm",  method = RequestMethod.POST)
	public void uploadForm(MultipartFile file, Model model) throws Exception {
		logger.info("originalName :"+file.getOriginalFilename());
		logger.info("size :"+file.getSize());
		logger.info("contentType : " + file.getContentType());
		
		String savedName = uploadFile(file.getOriginalFilename(), file.getBytes());
		model.addAttribute("savedName",savedName); 
	}
	
	private String uploadFile(String originalName, byte[] fileData) throws Exception {
		
		UUID uid = UUID.randomUUID();
		String savedName = uid.toString() + "_" + originalName;
		File target = new File(productImgPath, savedName);
		FileCopyUtils.copy(fileData, target);
		
		return savedName;
	}
	
	@RequestMapping(value="/uploadajax", method=RequestMethod.GET)
	public void uploadAjax() {}
	
	@ResponseBody
	@RequestMapping(value="/uploadajax", method=RequestMethod.POST, produces="text/plan;charset=UTF-8")
	public ResponseEntity<String> uploadAjax(MultipartFile file) throws Exception{
		
		logger.info("originalName :"+file.getOriginalFilename());
		logger.info("size :"+file.getSize());
		logger.info("contentType : " + file.getContentType());
		logger.info(productImgPath);
		return new ResponseEntity<>(UploadFileUtils.uploadFile(productImgPath, file.getOriginalFilename(), file.getBytes()), HttpStatus.CREATED);
	}
	
	@ResponseBody
	@RequestMapping("/displayfile")
	public ResponseEntity<byte[]> displayFile(String fileName)throws Exception{
		
		InputStream in =null;
		ResponseEntity<byte []> entity = null;
		
		logger.info("[displayFile] --> File Name : " + fileName + " [uploadPath] : "+productImgPath);
		try {
			String formatName = fileName.substring(fileName.lastIndexOf(".")+1);
			MediaType mType = MediaUtils.getMediaType(formatName);
			HttpHeaders headers = new HttpHeaders();
			in = new FileInputStream(productImgPath+fileName);
			
			if(mType!= null) {
				headers.setContentType(mType);
			}else {
				fileName = fileName.substring(fileName.indexOf("_")+1);
				headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
				 headers.add("Content-Disposition", "attachment; filename=\""+ 
				          new String(fileName.getBytes("UTF-8"), "ISO-8859-1")+"\"");
			}
			
			entity = new ResponseEntity<byte[]>(IOUtils.toByteArray(in),headers,HttpStatus.CREATED);
			
		}catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<byte[]>(HttpStatus.BAD_REQUEST);
		}finally {
			in.close();
		}
		return entity;
		
	}
	
	@ResponseBody
	@RequestMapping(value="/deletefile", method=RequestMethod.POST)
	public ResponseEntity<String> deleteFile(String fileName){
		logger.info("delete file : " + fileName);
		
		String formatName = fileName.substring(fileName.lastIndexOf(".")+1);
		
		MediaType mType = MediaUtils.getMediaType(formatName);
		
		if(mType!= null) {
			
			String front = fileName.substring(0, 12);
			String end = fileName.substring(14);
			new File(productImgPath+(front+end).replace('/', File.separatorChar)).delete();
		}
		
		new File(productImgPath+fileName.replace('/', File.separatorChar)).delete();
		
		return new ResponseEntity<String>("deleted",HttpStatus.OK);
	}
	
	@ResponseBody
	@RequestMapping(value="/deleteallfiles",method=RequestMethod.POST)
	public ResponseEntity<String> deleteFile(@RequestParam("file[]") String[] files){
		
		logger.info("delete all file : " + files);
		
		if(files == null || files.length == 0) {
			return new ResponseEntity<String>("deleted", HttpStatus.OK);
		}
		
		for (String fileName : files) {
			String formatName = fileName.substring(fileName.lastIndexOf(".")+1);
			
			MediaType mType = MediaUtils.getMediaType(formatName);
			
			if(mType !=null) {
				String front = fileName.substring(0, 12);
				String end = fileName.substring(14);
				new File(productImgPath+(front+end).replace('/', File.separatorChar)).delete();
			}
			
			new File(productImgPath+fileName.replace('/', File.separatorChar)).delete();
		}
		return new ResponseEntity<String>("deleted", HttpStatus.OK);
	}
	
	
	
	/** ArticleImg upload */
	
	private String uploadFiles(String originalName, byte[] fileData) throws Exception {
		
		UUID uid = UUID.randomUUID();
		String savedName = uid.toString() + "_" + originalName;
		File target = new File(articleImgPath, savedName);
		FileCopyUtils.copy(fileData, target);
		
		return savedName;
	}
	
	@RequestMapping(value="/uploadajaxart", method=RequestMethod.GET)
	public void uploadAjaxArt() {}
	
	@ResponseBody
	@RequestMapping(value="/uploadajaxart", method=RequestMethod.POST, produces="text/plan;charset=UTF-8")
	public ResponseEntity<String> uploadAjaxArt(MultipartFile file) throws Exception{
		
		logger.info("originalName :"+file.getOriginalFilename());
		logger.info("size :"+file.getSize());
		logger.info("contentType : " + file.getContentType());
		logger.info(articleImgPath);
		return new ResponseEntity<>(UploadFileUtils.uploadFile(articleImgPath, file.getOriginalFilename(), file.getBytes()), HttpStatus.CREATED);
	}
	
	@ResponseBody
	@RequestMapping("/displayfileart")
	public ResponseEntity<byte[]> displayFileArt(String fileName)throws Exception{
		
		InputStream in =null;
		ResponseEntity<byte []> entity = null;
		
		logger.info("[displayFile] --> File Name : " + fileName + " [uploadPath] : "+articleImgPath);
		try {
			String formatName = fileName.substring(fileName.lastIndexOf(".")+1);
			MediaType mType = MediaUtils.getMediaType(formatName);
			HttpHeaders headers = new HttpHeaders();
			in = new FileInputStream(articleImgPath+fileName);
			
			if(mType!= null) {
				headers.setContentType(mType);
			}else {
				fileName = fileName.substring(fileName.indexOf("_")+1);
				headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
				 headers.add("Content-Disposition", "attachment; filename=\""+ 
				          new String(fileName.getBytes("UTF-8"), "ISO-8859-1")+"\"");
			}
			
			entity = new ResponseEntity<byte[]>(IOUtils.toByteArray(in),headers,HttpStatus.CREATED);
			
		}catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<byte[]>(HttpStatus.BAD_REQUEST);
		}finally {
			in.close();
		}
		return entity;
		
	}
	
	@ResponseBody
	@RequestMapping(value="/deletefileart", method=RequestMethod.POST)
	public ResponseEntity<String> deleteFileArt(String fileName){
		logger.info("delete file : " + fileName);
		
		String formatName = fileName.substring(fileName.lastIndexOf(".")+1);
		
		MediaType mType = MediaUtils.getMediaType(formatName);
		
		if(mType!= null) {
			
			String front = fileName.substring(0, 12);
			String end = fileName.substring(14);
			new File(articleImgPath+(front+end).replace('/', File.separatorChar)).delete();
		}
		
		new File(articleImgPath+fileName.replace('/', File.separatorChar)).delete();
		
		return new ResponseEntity<String>("deleted",HttpStatus.OK);
	}
	
	@ResponseBody
	@RequestMapping(value="/deleteallfilesart",method=RequestMethod.POST)
	public ResponseEntity<String> deleteFileArt(@RequestParam("file[]") String[] files){
		
		logger.info("delete all file : " + files);
		
		if(files == null || files.length == 0) {
			return new ResponseEntity<String>("deleted", HttpStatus.OK);
		}
		
		for (String fileName : files) {
			String formatName = fileName.substring(fileName.lastIndexOf(".")+1);
			
			MediaType mType = MediaUtils.getMediaType(formatName);
			
			if(mType !=null) {
				String front = fileName.substring(0, 12);
				String end = fileName.substring(14);
				new File(articleImgPath+(front+end).replace('/', File.separatorChar)).delete();
			}
			
			new File(articleImgPath+fileName.replace('/', File.separatorChar)).delete();
		}
		return new ResponseEntity<String>("deleted", HttpStatus.OK);
	}
	
}
