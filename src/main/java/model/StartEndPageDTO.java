package model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class StartEndPageDTO {
	private Long startPage;
	private Long endPage;
	private Long selectNum;		// 특정 게시글 선택시 사용
	private Long memberNum;		// 특정 회원의 번호 선택시 사용
	private String category;	// 특정 종류 선택시 사용
	private String status;		// 특정 상태 선택시 사용
}	
