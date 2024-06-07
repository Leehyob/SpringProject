package kr.trip.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class BoardlikeVO {
   
   private Long likeNum;
   private int board_id;
   private String member_email;
}