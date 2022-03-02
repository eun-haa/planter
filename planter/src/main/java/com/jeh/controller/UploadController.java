package com.jeh.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.UUID;

import org.springframework.core.io.FileSystemResource;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.multipart.MultipartFile;

import com.jeh.domain.AttachFileDTO;

import net.coobird.thumbnailator.Thumbnailator;

@Controller
public class UploadController {
	@GetMapping("uploadAjax")
	public void uploadAjaxForm(){
		System.out.println("파일 업로드 화면");
	}
	
	//-----------------------------------------------------------------
	// < 년/월/일 폴더를 생성 > 하기 위한 폴더 이름 추출하여 리턴
	// 실제로 폴더를 만드는 곳은 메서드 내부
	private String getFolder() {
		// 1.현재 날짜를 추출
		Date date = new Date(); // Tue Jan 18 09:34:09 KST 2022
		
		// 2.yyyy-MM-dd 형식으로 변경
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		sdf.format(date);
		
		// 3. yyyy-MM-dd -> yyyy\MM\dd 형식으로 변경(폴더 경로 만들기 위해서)
		String str = sdf.format(date);
		
		return str.replace("-", File.separator);
	}// private String getFolder() 끝
	
	//-----------------------------------------------------------------
	// < 썸네일 생성 >
	// 1. 썸네일 이미지 생성을 할 것인지 안 할 것인지에 대해 판단하는 메서드 생성
	// -> img 파일이 아닌 경우에는 썸네일 생성을 할 필요 X 
	// -> 사용자가 업로드 한 파일의 종류가 img인지 아닌지에 대한 판단 필요
	private boolean checkImage(File file) {
		try {
			String contentType = Files.probeContentType(file.toPath());
			// file의 경로[폴더]를 확인하고, 그 안에 있는 MIME 타입을 확인하기 위한 작업.
			
			// 파일의 타입이 image이면 true, 그렇지 않으면 false
			return contentType.startsWith("image");
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
		
	}
	
	
	
	
	
	//-----------------------------------------------------------------
	@PostMapping(value="uploadAjaxAction", produces={MediaType.APPLICATION_JSON_VALUE})
	public ResponseEntity<ArrayList<AttachFileDTO>> uploadAjaxAction(MultipartFile[] uploadFile) {
		
		// AttachFileDTO에 저장되는 값이 여러 파일에 대한 값이면 배열로 처리가 되어야 하므로 ArrayList type
		// -> 이 메서드 제일 하단에 return으로 결과 반환
		ArrayList<AttachFileDTO> list = new ArrayList<>();
		
		
		// 파일 업로드 경로 지정
		String uploadFolder = "D:\\User\\upload\\";
		
		// * 년/월/일 폴더를 생성 *
		// 폴더 생성                                (기존 폴더 경로 + 현재 만들 폴더 결합)
		File uploadPath = new File(uploadFolder, getFolder());
		System.out.println("uploadPath = " + uploadPath);
		
		// * 화면에 썸네일을 보여주기 위해서 *
		// 2-1.파일 경로 저장
		String uploadFolderPath = getFolder();
		
		// 현재 만드려고 하는 폴더가 없으면
		if(uploadPath.exists()==false) {
			// 폴더 생성
			// .mkdirs() = makeDirectories
			uploadPath.mkdirs();
		}
		
		//---------------------------------------
		// 파일 정보를 불러오는 for문
		for(MultipartFile multipartFile : uploadFile) {
			//	  타입	            변수명		         배열명
			// UploadController에 있는 uploadAjaxAction메서드에서 AttachFileDTO를 사용해서 값을 저장
			// UploadController에 AttachFileDTO를 포함시켜서 사용
			AttachFileDTO attachdto = new AttachFileDTO();
			
			// 사용자가 업로드 한 실제 파일 이름
			System.out.println("MultipartFile/name = " + multipartFile.getOriginalFilename());
			
			// 사용자가 업로드 한 실제 파일 크기
			System.out.println("MultipartFile/size = " + multipartFile.getSize());
			
			// 사용자가 업로드 한 실제 파일 형식
			System.out.println("MultipartFile/type = " + multipartFile.getContentType());
			
			//---------------------------------------
			// * uuid(다른 이름)으로 파일 업로드 *
			// 1. uuid를 사용하기 위해서 생성(실제 파일명을 저장하는 변수)
			String uploadFileName = multipartFile.getOriginalFilename();
			//-------------------------------------------
			// * 화면에 썸네일을 보여주기 위해서 *
			// 1.파일 이름 저장
			// 실제 파일명(uploadFileName)을 AttachFileDTO 클래스에 fileNAme에 저장(setFileName)
			attachdto.setFileName(uploadFileName);
			//-------------------------------------------
			// 2. 중복이 되지않는 문자열 생성
			UUID uuid = UUID.randomUUID();
			
			// 3. UUID + "_" + getOriginalFilename()의 조합으로 파일명 생성
			uploadFileName = uuid.toString() + "_" + uploadFileName;
			
			
			//---------------------------------------
			// File 클래스 : 자바에서 file 입출력을 담당하는 클래스, 기본 생성자 없음
			// uploadFolder에 저장되어 있는 경로로 실제 파일명(multipartFile.getOriginalFilename())으로 저장
			File saveFile = new File(uploadPath, uploadFileName);
			
			// multipartFile.transferTo(saveFile)를 사용하기 위해서 예외처리 해주었음
			try {
				multipartFile.transferTo(saveFile);
				
				// * 화면에 썸네일을 보여주기 위해서 *
				// 2-2.파일 경로 저장
				// 실제 파일경로(uploadFolderPath)를 AttachFileDTO클래스(attachdto)에 uploadPath에 저장(setUploadPath)
				// try 안이 아니라 for문 안에 만 선언하면 됨(0,1,2번째 파일 경로가 들어가야 함)
				attachdto.setUploadPath(uploadFolderPath);
				
				// * 화면에 썸네일을 보여주기 위해서 *
				// 3.uuid 저장
				// uuid값(UUID)를 AttachFileDTO 클래스(attachdto) 내부에 uuid(변수)에 저장(setUuid)
				attachdto.setUuid(uuid.toString()); // toString : 문자열로 저장

				// < 썸네일 생성 >
				// 2.image 파일이면
				if(checkImage(saveFile)) {
					// * 화면에 썸네일을 보여주기 위해서 *
					// 4.image 저장
					// FileType값(image)를 AttachFileDTO 클래스(attachdto) 내부에 image(변수)에 저장(setImage)
					attachdto.setImage(true);
					
					// 썸네일 파일을 생성하기 전에 썸네일 파일 이름을 수정(기존 파일명에 "s_" 추가)
					FileOutputStream thumbnail = new FileOutputStream(new File(uploadPath, "s_" + uploadFileName));
					
					Thumbnailator.createThumbnail(multipartFile.getInputStream(), thumbnail, 100, 100);
					
					// 썸네일 종료(메모리 공간 환수)
					thumbnail.close();
				}
				// * 화면에 썸네일을 보여주기 위해서 *
				// 5.add()를 통해서 각 파일에 대한 정보들이 list에 들어오게 됨
				list.add(attachdto);
				
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} 
		}// for문 끝
		//--------------------------------------------------------------
		// * 화면에 썸네일을 보여주기 위해서 *
		// 6.통신상태가 정상적(HttpStatus.OK)이면 ArrayList에 저장되어 있는 값을 웹브라우저에 보내라.
		return new ResponseEntity<>(list,HttpStatus.OK);
	}
	
	// 이미지 파일 출력을 위한 주소 생성
	@GetMapping("display")
	public ResponseEntity<byte[]> getFile(String fileName){
		// getFile()은 문자열로 파일의 경로가 포함된 fileName을 매개변수로 받고 byte[](이진수)를 전송
		
		System.out.println("url 주소를 통한 fileName = " + fileName);
		
		File file = new File("D:\\User\\upload\\" + fileName);
		
		System.out.println("file = " + file);
		
		ResponseEntity<byte[]> result = null;
		
		// byte[]로 이미지 파일의 데이터를 전송할 때 브라우저에 보내는 MIME 타입이 파일의 종류에 따라 달라짐(JPG, PNG, XLS, PPT)
		// 이 부분을 해결하기 위해서 probeContentType()을 이용해서 적절한 MIME 타입 데이터를 Http의 에러 메세지에 포함할 수 있도록 처리
		
		try {
			HttpHeaders header = new HttpHeaders();
			result = new ResponseEntity<>(FileCopyUtils.copyToByteArray(file),header,HttpStatus.OK);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return result;
	}
	
	// 업로드한 파일의 타입이 이미지가 아닐 때 웹 브라우저를 통해서 download 할 수 있게
	// 웹 브라우저가 이 파일은 download 해야하는 파일입니다. 하는 것을 인지할 수 있도록 반환이 되어야 함
	// 그러기 위해서는 APPLICATION_OCTET_STREAM_VALUE 타입으로 반환데이터 타입 선언(produces = 반환 타입)
	@GetMapping(value="download", produces=MediaType.APPLICATION_OCTET_STREAM_VALUE)
	public ResponseEntity<Resource> downloadFile(String fileName){
		System.out.println("download fileName" + fileName);
		
		Resource resource = new FileSystemResource("D:\\User\\upload\\" + fileName);
		System.out.println("download resource" + resource);
		
		String resourceName = resource.getFilename();
		
		HttpHeaders header = new HttpHeaders();
		
		try {
			header.add("content-Disposition", "attachment ; fileName = " + new String(resourceName.getBytes("UTF-8"), "ISO-8859-1"));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return new ResponseEntity<Resource>(resource, header, HttpStatus.OK);
	}
}
