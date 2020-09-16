package com.kh.springFinal.service;


import java.io.File;
import java.io.IOException;
import java.net.URLEncoder;
import java.util.List;

import org.apache.commons.io.FileUtils;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ByteArrayResource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.kh.springFinal.entity.ProfessorFileDto;
import com.kh.springFinal.repository.ProfessorDao;

@Service
public class ProfessorServiceImpl implements ProfessorService{
	
	@Autowired
	private SqlSession sqlSession;

	@Autowired
	private ProfessorDao professorDao;
	
	@Override
	public void add(ProfessorFileDto professorFileDto, MultipartFile file, int profe_no) throws IllegalStateException, IOException {
		
		//이미지 업로드
		professorFileDto.setProfe_no(profe_no);
		professorFileDto.setProfe_file_name(file.getOriginalFilename());
		professorFileDto.setProfe_file_type(file.getContentType());
		professorFileDto.setProfe_file_size(file.getSize());
	
		int no = professorDao.img_regist(professorFileDto);
		File target=new File("D:/upload",String.valueOf(no));
		file.transferTo(target);
	
	}

	//교수 이미지 받기
	@Override
	public ResponseEntity<ByteArrayResource> getFile(int profe_file_no) throws IOException{
		
		//교수번호로 해당 이미지 List
//		List<ProfessorFileDto> list = sqlSession.selectList("profeFile.getFile", profe_no);
//		int profe_file_no = list.get(0).getProfe_file_no();//list 첫 번째 겟
		ProfessorFileDto professorFileDto = sqlSession.selectOne("profeFile.getImg",profe_file_no);
		System.out.println(profe_file_no);
		
		if(professorFileDto==null) {//정보가 없으면
			return ResponseEntity.notFound().build();
		}
		else { //정보가 있으면
				File target = new File("D:/upload",String.valueOf(profe_file_no));
				byte[] data = FileUtils.readFileToByteArray(target);
				ByteArrayResource res = new ByteArrayResource(data);
					
					return ResponseEntity
									.ok()
									.contentType(MediaType.APPLICATION_OCTET_STREAM) //다운로드스트림
									.contentLength(professorFileDto.getProfe_file_size())
									.header(HttpHeaders.CONTENT_DISPOSITION, "attachment; filename=\""+URLEncoder.encode(professorFileDto.getProfe_file_name(), "UTF-8")+"\"")
									.header(HttpHeaders.CONTENT_ENCODING, "UTF-8")
								.body(res);
				}
			}

	
	@Override
	public ProfessorFileDto getFileNo(int profe_no) throws IOException{
		
		return sqlSession.selectOne("profeFile.getFile", profe_no);
	
	}
	
	
	
	  //기존 사진 중복 확인 후 수정 
	  @Override
	  public void getEdit(int profe_no) {
	 
	  sqlSession.selectOne("profeFile.getEdit", profe_no); 
	  }
	 
	
	
	//사진 삭제
	@Override
	public void delete(int profe_file_no) {
		sqlSession.selectOne("profeFile.delete", profe_file_no);
	}

	@Override
	public void removeandinsert(int profe_file_no, MultipartFile file, ProfessorFileDto professorFileDto) {
		// TODO Auto-generated method stub
		
	}
	
	/*
	 * //사진 검사 후 삭제
	 * 
	 * @Override public void removeandinsert(int profe_file_no,
	 * 
	 * @RequestParam MultipartFile file,
	 * 
	 * @RequestParam ProfessorFileDto professorFileDto ) {
	 * 
	 * //기존 이미지 불러오기 MultipartFile file = ; professorFileDto.getProfe_no(profe_no);
	 * professorFileDto.getProfe_file_name(file.getOriginalFilename());
	 * professorFileDto.getProfe_file_type(file.getContentType());
	 * professorFileDto.getProfe_file_size(file.getSize());
	 * 
	 * boolean result = file.getSize()>0;
	 * 
	 * if(result) { //이미지가 존재하면 this.delete(profe_file_no); //파일정보 지워 File target =
	 * new File("D:/upload",String.valueOf(profe_file_no)); target.delete();//파일 지워
	 * }
	 * 
	 * this.add(professorFileDto, file, profe_no); //새로 넣어 ㄴㄴ }
	 */
	}

