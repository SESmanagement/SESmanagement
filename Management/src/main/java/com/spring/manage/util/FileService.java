package com.spring.manage.util;

import java.io.File;
import java.io.IOException;

import org.springframework.web.multipart.MultipartFile;

public class FileService {

	public static String saveFile(String uploadPath, MultipartFile upload, String userid) {

		// 파일이 전송되었으므로 복사 작업
		File path = new File(uploadPath);
		// 저장 디렉토리가 없다면 생성
		if (!path.isDirectory()) path.mkdir();
		
		String originalFileName = upload.getOriginalFilename();

		String filename; // 확장명을 뺀 파일명
		String ext; // 파일명을 뺀 확장명
		String savedFileName = ""; // HDD에 저장되는 파일명 : filename + "_" + UUID +
									// "." + ext

		int lastIndex = originalFileName.lastIndexOf(".");
		filename = originalFileName.substring(0, lastIndex); // -1인 경우는 다 가져옴

		// 확장자가 없는 경우
		if (lastIndex == -1)
			ext = "";
		// 확장자는 있는 경우
		else
			ext = originalFileName.substring(lastIndex + 1);

		// HDD에 저장할 savedFileName 작성
		savedFileName = userid + "." + ext;

		// 파일 객체 생성 : 경로 + 파일명
		File serverFile = new File(uploadPath+"/"+ savedFileName);
		try {
			// HDD 저장
			upload.transferTo(serverFile);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return savedFileName;
	}
	
	public static boolean deleteFile(String fullPath){
		
		File delFile = new File(fullPath);
		if(delFile.isFile()){
			delFile.delete();
			return true;
		}
		return false;
	}

}
