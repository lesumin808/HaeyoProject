package com.haeyo.biz.professionMypage.impl;



import java.io.File;
import java.io.IOException;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.haeyo.biz.board.impl.TogetherBoardServiceImpl;
import com.haeyo.biz.profession.ProfessionSubVO;
import com.haeyo.biz.profession.ProfessionVO;
import com.haeyo.biz.user.UserVO;


@Service("ProfessionMypageService")
public class ProfessionMypageServiceImpl implements ProfessionMypageService{
	
	private static final Logger logger = LoggerFactory.getLogger(ProfessionMypageServiceImpl.class);
	
	@Autowired
	private ProfessionMypageDAO professionMypageDao;
	
	@Autowired
	HttpSession httpSession;
	
	
	@Override
	public void updateProfile(ProfessionVO vo, MultipartHttpServletRequest request) throws Exception{
		System.out.println("ProfessionMypageService에서 update : file_upload 기능 처리");
		String pPic = "";
		String cert = ""; 
		
		Iterator<String> files = request.getFileNames();
		while(files.hasNext()) {
			String file = files.next();
			
			MultipartFile uploadFile = request.getFile(file);
			if(!uploadFile.isEmpty()) {
				String paramName = uploadFile.getName();
				String fileName = uploadFile.getOriginalFilename();
				String rootPath = httpSession.getServletContext().getRealPath("/");
				String attachPath = "/resources/image/";
				uploadFile.transferTo(new File(rootPath+attachPath+fileName));
				
				System.out.println("파일 경로: " + rootPath+attachPath+fileName);
				System.out.println("파일 이름: " + paramName + ":"+ fileName);
				
				if(paramName.equals("file_pic")) {
					pPic = fileName; 
				}else if(paramName.equals("file_cert")) {
					cert = fileName;
				}
			}
//			else { 업로드 파일이  null일때 DB값 변경되는거 막기 안되면 스크립트에서 다시 넣게 정리}
			
		}
		vo.setpPic(pPic);
		vo.setCertification(cert);
		logger.info("ProfessionVO : " + vo);
		professionMypageDao.updateProfile(vo);
	}
	
	@Override
	public void deleteProfile(int pNo) {
		System.out.println("ProfessionMypageService에서 deleteProfile 기능 처리");
		professionMypageDao.deleteProfile(pNo);
		
	}

	@Override
	public ProfessionVO getProfile(UserVO userVO) {
		System.out.println("ProfessionMypageService에서 getProfile() 기능 처리");
		return (ProfessionVO) professionMypageDao.getProfile(userVO);
	}

	
	@Override
	public void deleteSubCate(ProfessionVO proVO) {
		professionMypageDao.deleteSubCate(proVO);
		
	}

	@Override
	public void insertSubCate(ProfessionSubVO subvo, ProfessionVO vo) {
		String pCategory = vo.getpCategory(); 

		if(pCategory.equals("청소")) {
	    	professionMypageDao.insertCleaning(subvo);
	    	
	    }else if(pCategory.equals("이사")){
	    	professionMypageDao.insertMoving(subvo);
	    	
	    }else if(pCategory.equals("수리")) {
	    	professionMypageDao.insertRepair(subvo);
	    }
		
	}

	@Override
	public ProfessionSubVO getSubCategory(int pNo, String pCategory) {
		System.out.println("ProfessionMypageServiceImpl에서 서브카테고리 가져오기");
		
		if(pCategory.equals("청소")) {
				return professionMypageDao.getCleaning(pNo);
		}else if(pCategory.equals("이사")) {
				return professionMypageDao.getMoving(pNo);
		}else {
				return professionMypageDao.getRepair(pNo);
		}
		
	}

	
	
//	@Override
//	public ProfessionVO uploadFiles(ProfessionVO vo) throws Exception {
//		
//		
//		List<MultipartFile> fileList = vo.getUploadFiles();
//		if(!fileList.isEmpty()) {
//			
//				String fileName = uploadFile.getOriginalFilename();
//				String rootPath = httpSession.getServletContext().getRealPath("/");
//				String attachPath = "/resources/image/";
//				uploadFile.transferTo(new File(rootPath+attachPath+fileName));
//				System.out.println("uploadFile : " + fileName);
//			
//		}
//		
//			return ProfessionVO;
//	}

	
		
}
