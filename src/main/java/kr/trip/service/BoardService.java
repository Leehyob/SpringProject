package kr.trip.service;

import java.util.List;
import java.util.Map;

import kr.trip.domain.BoardVO;
import kr.trip.domain.BoardlikeVO;
import kr.trip.domain.Criteria;
import kr.trip.domain.MemberVO;

public interface BoardService {
   //게시물삽입
   public void register(BoardVO board);
   //게시물상세보기
   public BoardVO get(int board_id);
   //게시물수정
   public boolean modify(BoardVO board);
   //게시물삭제
   public boolean remove(int board_id);
   //게시물 전체리스트출력
   public List<BoardVO> getList(Criteria cri);
   //게시물 전체갯수
   public int getTotal(Criteria cri);
   //게시물 좋아요
   public int addLike(BoardlikeVO like);
   //게시물 좋아요 취소
   public int removeLike(BoardlikeVO like);
   //게시물 좋아요 갯수 카운트
   public boolean getCountByboard_like(int board_id, String member_email);
   

}