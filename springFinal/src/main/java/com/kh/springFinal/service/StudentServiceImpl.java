package com.kh.springFinal.service;

import java.io.File;
import java.io.IOException;
import java.net.URLEncoder;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ByteArrayResource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.kh.springFinal.entity.ClassSubjectFileDto;
import com.kh.springFinal.entity.StudentFileDto;
import com.kh.springFinal.entity.StudentFileDto;
import com.kh.springFinal.repository.ClassSubjectDao;
import com.kh.springFinal.repository.StudentDao;

@Service
public class StudentServiceImpl implements StudentService{
	
	@Autowired
	private StudentDao studentDao;
	//업로드
	@Override
	public void fileupload(StudentFileDto studentFileDto, MultipartFile file, int student_no) throws IllegalStateException, IOException {
		//단일조회하고
		StudentFileDto student_File_check = studentDao.getFile(student_no);
		//있으면 지우고 다시 만들기
		if(student_File_check != null) {
			studentDao.delFile(student_no);
			
			File target = new File("D:/upload1",String.valueOf(student_File_check.getStudent_file_no()));
			target.delete();
			
			studentFileDto.setStudent_no(student_no);
			studentFileDto.setStudent_file_name(file.getOriginalFilename());
			studentFileDto.setStudent_file_size(file.getSize());
			studentFileDto.setStudent_file_type(file.getContentType());
			
			int student_file_no = studentDao.student_file_add(studentFileDto);
			File target2 = new File("D:/upload1",String.valueOf(student_file_no));
			file.transferTo(target2);
		}
		//없으면 만들기
		else {
			
			studentFileDto.setStudent_no(student_no);
			studentFileDto.setStudent_file_name(file.getOriginalFilename());
			studentFileDto.setStudent_file_size(file.getSize());
			studentFileDto.setStudent_file_type(file.getContentType());
			
			int student_file_no = studentDao.student_file_add(studentFileDto);
			File target = new File("D:/upload1",String.valueOf(student_file_no));
			file.transferTo(target);
		}
		
		
		
	}
	//다운로드
	@Override
	public ResponseEntity<ByteArrayResource> getFile(int student_file_no) throws IOException {
		StudentFileDto studentFileDto = studentDao.getFile(student_file_no);
		
		if(studentFileDto==null) {//정보가 없으면
			return ResponseEntity.notFound().build();
		}
		else { //정보가 있으면
				File target = new File("D:/upload",String.valueOf(student_file_no));
				byte[] data = FileUtils.readFileToByteArray(target);
				ByteArrayResource res = new ByteArrayResource(data);
					
					return ResponseEntity
									.ok()
									.contentType(MediaType.APPLICATION_OCTET_STREAM) //다운로드스트림
									.contentLength(studentFileDto.getStudent_file_size())
									.header(HttpHeaders.CONTENT_DISPOSITION, "attachment; filename=\""+URLEncoder.encode(studentFileDto.getStudent_file_name(), "UTF-8")+"\"")
									.header(HttpHeaders.CONTENT_ENCODING, "UTF-8")
								.body(res);
				}
		
	}


//	@Override
//	public void addFileupload(StudentFileuploadDto studentFileuploadDto, MultipartFile file, int class_sub_no) throws IllegalStateException, IOException {
//		
//		studentFileuploadDto.setStudent_file_no(class_sub_no);
//		studentFileuploadDto.setStudent_file_name(file.getOriginalFilename());
//		studentFileuploadDto.setStudent_file_type(file.getContentType());
//		studentFileuploadDto.setStudent_file_size(file.getSize());
//		
//		int sub_file_no = classSubjectDao.addFileupload(studentFileuploadDto);
//		
//		File taget = new File("D:/upload/student", String.valueOf(sub_file_no));
//		file.transferTo(taget);
//		
//		
//	}

}
