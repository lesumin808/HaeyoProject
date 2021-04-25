package com.haeyo.web.user;

import java.util.List;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

public class MainController {
	private static final int RESULT_EXCEED_SIZE = -2;
	private static final int RESULT_UNACCEPTED_EXTENSION = -1;
	private static final int RESULT_SUCCESS = 1;
	private static final long LIMIT_SIZE = 10 * 1024 * 1024;

	@RequestMapping("/")
	public String main() {
		return "index";
	}

	// 로직은 언제나 Service에서 짜도록 하자.
	// 중간실패시 rollback은 고려하지 않았음.
	@ResponseBody
	@RequestMapping(value = "/imageupload", method = RequestMethod.POST)
	public int multiImageUpload(@RequestParam("files") List<MultipartFile> images) {
		long sizeSum = 0;
		for (MultipartFile image : images) {
			String originalName = image.getOriginalFilename();
			// 확장자 검사
			if (!isValidExtension(originalName)) {
				return RESULT_UNACCEPTED_EXTENSION;
			}

			// 용량 검사
			sizeSum += image.getSize();
			if (sizeSum >= LIMIT_SIZE) {
				return RESULT_EXCEED_SIZE;
			}

			// TODO 저장..
		}

		// 실제로는 저장 후 이미지를 불러올 위치를 콜백반환하거나,
		// 특정 행위를 유도하는 값을 주는 것이 옳은 것 같다.
		return RESULT_SUCCESS;
	}

	// required above jdk 1.7 - switch(String)
	private boolean isValidExtension(String originalName) {
		String originalNameExtension = originalName.substring(originalName.lastIndexOf(".") + 1);
		switch (originalNameExtension) {
		case "jpg":
		case "png":
		case "gif":
			return true;
		}
		return false;
	}
}
