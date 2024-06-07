package kr.trip.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import kr.trip.domain.Criteria;
import kr.trip.domain.ReplyVO;

public interface ReplyMapper {
   
   //댓글삽입
   public int insert(ReplyVO vo);
   //댓글읽기
   public ReplyVO read(int replyNum);
   //댓글수정
   public int update(ReplyVO reply);
   //댓글삭제
   public int delete(int replyNum);
   //댓글페이징
   public List<ReplyVO> getListWithPaging(
         @Param("cri") Criteria cri,
         @Param("board_id")int board_id
         );
   
   //게시글댓글카운트
   public int getCountByboard_id(int board_id);
}