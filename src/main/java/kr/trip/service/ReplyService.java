package kr.trip.service;

import kr.trip.domain.Criteria;
import kr.trip.domain.ReplyPageDTO;
import kr.trip.domain.ReplyVO;

public interface ReplyService {
   //댓글등록
   public int register(ReplyVO reply);
   //댓글보기
   public ReplyVO get(int replyNum);
   //댓글수정
   public int modify(ReplyVO reply);
   //댓글삭제
   public int remove(int replyNum);
   //댓글페이징
   public ReplyPageDTO getList(Criteria cri, int board_id); 
   
}