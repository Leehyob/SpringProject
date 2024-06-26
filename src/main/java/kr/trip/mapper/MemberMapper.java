package kr.trip.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import kr.trip.domain.AuthVO;
import kr.trip.domain.MemberVO;
import kr.trip.domain.TravelPlanVO;

public interface MemberMapper {
	
	public MemberVO read(String member_email);
	
	public void insert(MemberVO member);
	
	public void insertAuth(AuthVO auth);
	
	public boolean selectId(String id);
	
	public List<String> findId(@Param("name") String name,@Param("phone") String phone);
	
	 public int update(MemberVO member);
	 
	 public void deleteMember(String member_email);
	 
	 public List<MemberVO>getListMember();
	 
	   //마이페이지 여행정보
	   public List<MemberVO> viewMember(String member_email);
	   //마이페이지 개인정보
	   public List<TravelPlanVO> viewPlan(String member_email);
	   //프로필 정보
	   public MemberVO findByMemberEmail(String member_email);
	   
	    public int updateprofile(MemberVO member);

}