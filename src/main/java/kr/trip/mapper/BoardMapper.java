package kr.trip.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import kr.trip.domain.BoardVO;
import kr.trip.domain.BoardlikeVO;
import kr.trip.domain.Criteria;

public interface BoardMapper {

   // 게시물 전체리스트보기및페이징처리
   public List<BoardVO> getListWithPaging(Criteria cri);

   // 게시물 등록
   public void insert(BoardVO board);

   // 게시물 읽기
   public BoardVO read(int board_id);

   // 게시물 수정
   public int update(BoardVO boardVO);

   // 게시물 삭제
   public int delete(int board_id);

   // 게시물 총갯수
   public int getTotalCount(Criteria cri);

   // 새로운댓글카운트
   public void updateReplyCnt(@Param("board_id") int board_id, @Param("amount") int amount);

   // 게시물검색
   public List<BoardVO> search(Map<String, Map<String, String>> map);

   //게시글좋아요
   public int boardlike(BoardlikeVO like);
   
   //게시글좋아요취소
   public int boardunlike(BoardlikeVO like);
   
   //게시글좋아요 좋아요 카운트
   public void like(int board_id);
   
   //게시글좋아요 취소 카운트
   public int likeremove(int board_id);
   
   ///게시물 좋아요 상태
   public int getCountByboard_like(@Param("board_id")int board_id , @Param("member_email") String member_email);


}