INSERT INTO FBM_USERS(SEQ, ID, PW, NAME)
VALUES(FBM_USERS_SEQ.NEXTVAL, 'admin', '0', '관리자');

-- 0. 모든 팀원 등록
-- IN : 팀원명(NN), 팀ID, 등번호
INSERT INTO PLAYER(PLAYER_ID, PLAYER_NM, TEAM_ID, CAPTAIN)
VALUES(SEQ_PLAYER_ID.NEXTVAL,'박진호','','Y');
INSERT INTO PLAYER(PLAYER_ID, PLAYER_NM, TEAM_ID)
VALUES(SEQ_PLAYER_ID.NEXTVAL,'피경호','');
INSERT INTO PLAYER(PLAYER_ID, PLAYER_NM, TEAM_ID)
VALUES(SEQ_PLAYER_ID.NEXTVAL,'이규화','');
INSERT INTO PLAYER(PLAYER_ID, PLAYER_NM, TEAM_ID)
VALUES(SEQ_PLAYER_ID.NEXTVAL,'김재섭','');
INSERT INTO PLAYER(PLAYER_ID, PLAYER_NM, TEAM_ID)
VALUES(SEQ_PLAYER_ID.NEXTVAL,'박민수','');
INSERT INTO PLAYER(PLAYER_ID, PLAYER_NM, TEAM_ID)
VALUES(SEQ_PLAYER_ID.NEXTVAL,'이승구','');
INSERT INTO PLAYER(PLAYER_ID, PLAYER_NM, TEAM_ID, CAPTAIN)
VALUES(SEQ_PLAYER_ID.NEXTVAL,'고정현','','Y');
INSERT INTO PLAYER(PLAYER_ID, PLAYER_NM, TEAM_ID)
VALUES(SEQ_PLAYER_ID.NEXTVAL,'백승주','');
INSERT INTO PLAYER(PLAYER_ID, PLAYER_NM, TEAM_ID)
VALUES(SEQ_PLAYER_ID.NEXTVAL,'정우석','');
INSERT INTO PLAYER(PLAYER_ID, PLAYER_NM, TEAM_ID)
VALUES(SEQ_PLAYER_ID.NEXTVAL,'황준호','');
INSERT INTO PLAYER(PLAYER_ID, PLAYER_NM, TEAM_ID)
VALUES(SEQ_PLAYER_ID.NEXTVAL,'이창복','');
INSERT INTO PLAYER(PLAYER_ID, PLAYER_NM, TEAM_ID)
VALUES(SEQ_PLAYER_ID.NEXTVAL,'이정재','');
INSERT INTO PLAYER(PLAYER_ID, PLAYER_NM, TEAM_ID, CAPTAIN)
VALUES(SEQ_PLAYER_ID.NEXTVAL,'김낙원','','Y');
INSERT INTO PLAYER(PLAYER_ID, PLAYER_NM, TEAM_ID)
VALUES(SEQ_PLAYER_ID.NEXTVAL,'김준수','');
INSERT INTO PLAYER(PLAYER_ID, PLAYER_NM, TEAM_ID)
VALUES(SEQ_PLAYER_ID.NEXTVAL,'김동원','');
INSERT INTO PLAYER(PLAYER_ID, PLAYER_NM, TEAM_ID)
VALUES(SEQ_PLAYER_ID.NEXTVAL,'배진우','');
INSERT INTO PLAYER(PLAYER_ID, PLAYER_NM, TEAM_ID)
VALUES(SEQ_PLAYER_ID.NEXTVAL,'신민우','');
INSERT INTO PLAYER(PLAYER_ID, PLAYER_NM, TEAM_ID)
VALUES(SEQ_PLAYER_ID.NEXTVAL,'이주성','');

-- 1. 시즌테이블에 시즌row 추가
-- IN : 시즌이름(NN), 총 경기수(NN)
INSERT INTO SEASON(SEASON_ID, SEASON_NM, TOT_GAMES, MANAGER_ID)
VALUES(SEQ_SEASON_ID.NEXTVAL, '201701', 100, 'admin');
INSERT INTO SEASON(SEASON_ID, SEASON_NM, TOT_GAMES, MANAGER_ID)
VALUES(SEQ_SEASON_ID.NEXTVAL, '201702', 100, 'admin');

-- 2. 팀테이블에 참가팀 등록
-- IN : 팀명(NN), 시즌ID(NN)
INSERT INTO TEAM(TEAM_ID, TEAM_NM, SEASON_ID)
VALUES(SEQ_TEAM_ID.NEXTVAL, '1팀', 1);
INSERT INTO TEAM(TEAM_ID, TEAM_NM, SEASON_ID)
VALUES(SEQ_TEAM_ID.NEXTVAL, '2팀', 1);
INSERT INTO TEAM(TEAM_ID, TEAM_NM, SEASON_ID)
VALUES(SEQ_TEAM_ID.NEXTVAL, '3팀', 1);

-- 3. 회원테이블에 팀id 업데이트
-- IN : 팀ID, 팀원ID
UPDATE PLAYER SET TEAM_ID = '1' WHERE PLAYER_ID = 1;
UPDATE PLAYER SET TEAM_ID = '1' WHERE PLAYER_ID = 2;
UPDATE PLAYER SET TEAM_ID = '1' WHERE PLAYER_ID = 3;
UPDATE PLAYER SET TEAM_ID = '1' WHERE PLAYER_ID = 4;
UPDATE PLAYER SET TEAM_ID = '1' WHERE PLAYER_ID = 5;
UPDATE PLAYER SET TEAM_ID = '1' WHERE PLAYER_ID = 6;
UPDATE PLAYER SET TEAM_ID = '2' WHERE PLAYER_ID = 7;
UPDATE PLAYER SET TEAM_ID = '2' WHERE PLAYER_ID = 8;
UPDATE PLAYER SET TEAM_ID = '2' WHERE PLAYER_ID = 9;
UPDATE PLAYER SET TEAM_ID = '2' WHERE PLAYER_ID = 10;
UPDATE PLAYER SET TEAM_ID = '2' WHERE PLAYER_ID = 11;
UPDATE PLAYER SET TEAM_ID = '2' WHERE PLAYER_ID = 12;
UPDATE PLAYER SET TEAM_ID = '3' WHERE PLAYER_ID = 13;
UPDATE PLAYER SET TEAM_ID = '3' WHERE PLAYER_ID = 14;
UPDATE PLAYER SET TEAM_ID = '3' WHERE PLAYER_ID = 15;
UPDATE PLAYER SET TEAM_ID = '3' WHERE PLAYER_ID = 16;
UPDATE PLAYER SET TEAM_ID = '3' WHERE PLAYER_ID = 17;
UPDATE PLAYER SET TEAM_ID = '3' WHERE PLAYER_ID = 18;


-- 4. 테스트용 경기기록 입력
-- IN : 시즌ID, 팀ID(홈), 팀ID(어웨이), 팀ID(승리팀), 팀ID(패배팀), 홈팀득점수, 어웨이팀득점수
INSERT INTO RECORD_GAME(RG_SEQ, SEASON_ID, H_TEAM_ID, A_TEAM_ID, W_TEAM_ID, L_TEAM_ID, H_TEAM_GOALS, A_TEAM_GOALS)
VALUES(SEQ_RG_SEQ.NEXTVAL, 1, 1, 2, 1, 2, 1, 0);
INSERT INTO RECORD_GAME(RG_SEQ, SEASON_ID, H_TEAM_ID, A_TEAM_ID, W_TEAM_ID, L_TEAM_ID, H_TEAM_GOALS, A_TEAM_GOALS)
VALUES(SEQ_RG_SEQ.NEXTVAL, 1, 2, 3, 0, 0, 0, 0);
INSERT INTO RECORD_GAME(RG_SEQ, SEASON_ID, H_TEAM_ID, A_TEAM_ID, W_TEAM_ID, L_TEAM_ID, H_TEAM_GOALS, A_TEAM_GOALS)
VALUES(SEQ_RG_SEQ.NEXTVAL, 1, 3, 1, 0, 0, 0, 0);
INSERT INTO RECORD_GAME(RG_SEQ, SEASON_ID, H_TEAM_ID, A_TEAM_ID, W_TEAM_ID, L_TEAM_ID, H_TEAM_GOALS, A_TEAM_GOALS)
VALUES(SEQ_RG_SEQ.NEXTVAL, 1, 3, 2, 2, 3, 0, 2);
INSERT INTO RECORD_GAME(RG_SEQ, SEASON_ID, H_TEAM_ID, A_TEAM_ID, W_TEAM_ID, L_TEAM_ID, H_TEAM_GOALS, A_TEAM_GOALS)
VALUES(SEQ_RG_SEQ.NEXTVAL, 1, 1, 3, 0, 0, 1, 1);
INSERT INTO RECORD_GAME(RG_SEQ, SEASON_ID, H_TEAM_ID, A_TEAM_ID, W_TEAM_ID, L_TEAM_ID, H_TEAM_GOALS, A_TEAM_GOALS)
VALUES(SEQ_RG_SEQ.NEXTVAL, 1, 2, 3, 0, 0, 0, 0);

-- 4. 테스트용 골기록 입력
-- IN : 경기기록SEQ, 팀원ID, 득점시간
-- STARTING
INSERT INTO RECORD_PLAYER(RP_SEQ, SEASON_ID, RG_SEQ, TEAM_ID, PLAYER_ID, STARTING, PLAY_TIME)
VALUES(SEQ_RP_SEQ.NEXTVAL, 1, 1, 1, 1, 'Y', 15);
INSERT INTO RECORD_PLAYER(RP_SEQ, SEASON_ID, RG_SEQ, TEAM_ID, PLAYER_ID, STARTING, PLAY_TIME)
VALUES(SEQ_RP_SEQ.NEXTVAL, 1, 1, 1, 2, 'Y', 15);
INSERT INTO RECORD_PLAYER(RP_SEQ, SEASON_ID, RG_SEQ, TEAM_ID, PLAYER_ID, STARTING, PLAY_TIME)
VALUES(SEQ_RP_SEQ.NEXTVAL, 1, 1, 1, 3, 'Y', 15);
INSERT INTO RECORD_PLAYER(RP_SEQ, SEASON_ID, RG_SEQ, TEAM_ID, PLAYER_ID, STARTING, PLAY_TIME)
VALUES(SEQ_RP_SEQ.NEXTVAL, 1, 1, 1, 4, 'Y', 15);
INSERT INTO RECORD_PLAYER(RP_SEQ, SEASON_ID, RG_SEQ, TEAM_ID, PLAYER_ID, STARTING, PLAY_TIME)
VALUES(SEQ_RP_SEQ.NEXTVAL, 1, 1, 1, 5, 'Y', 15);
INSERT INTO RECORD_PLAYER(RP_SEQ, SEASON_ID, RG_SEQ, TEAM_ID, PLAYER_ID, STARTING, PLAY_TIME)
VALUES(SEQ_RP_SEQ.NEXTVAL, 1, 1, 2, 7, 'Y', 15);
INSERT INTO RECORD_PLAYER(RP_SEQ, SEASON_ID, RG_SEQ, TEAM_ID, PLAYER_ID, STARTING, PLAY_TIME)
VALUES(SEQ_RP_SEQ.NEXTVAL, 1, 1, 2, 8, 'Y', 15);
INSERT INTO RECORD_PLAYER(RP_SEQ, SEASON_ID, RG_SEQ, TEAM_ID, PLAYER_ID, STARTING, PLAY_TIME)
VALUES(SEQ_RP_SEQ.NEXTVAL, 1, 1, 2, 9, 'Y', 15);
INSERT INTO RECORD_PLAYER(RP_SEQ, SEASON_ID, RG_SEQ, TEAM_ID, PLAYER_ID, STARTING, PLAY_TIME)
VALUES(SEQ_RP_SEQ.NEXTVAL, 1, 1, 2, 10, 'Y', 15);
INSERT INTO RECORD_PLAYER(RP_SEQ, SEASON_ID, RG_SEQ, TEAM_ID, PLAYER_ID, STARTING, PLAY_TIME)
VALUES(SEQ_RP_SEQ.NEXTVAL, 1, 1, 2, 11, 'Y', 15);


-- GOAL
INSERT INTO RECORD_PLAYER(RP_SEQ, SEASON_ID, RG_SEQ, TEAM_ID, PLAYER_ID, GOAL, GOAL_TIME)
VALUES(SEQ_RP_SEQ.NEXTVAL, 1, 1, 1, 1, 1, SYSDATE);
INSERT INTO RECORD_PLAYER(RP_SEQ, SEASON_ID, RG_SEQ, TEAM_ID, PLAYER_ID, GOAL, GOAL_TIME)
VALUES(SEQ_RP_SEQ.NEXTVAL, 1, 4, 2, 7, 1, SYSDATE);
INSERT INTO RECORD_PLAYER(RP_SEQ, SEASON_ID, RG_SEQ, TEAM_ID, PLAYER_ID, GOAL, GOAL_TIME)
VALUES(SEQ_RP_SEQ.NEXTVAL, 1, 4, 2, 7, 1, SYSDATE);
INSERT INTO RECORD_PLAYER(RP_SEQ, SEASON_ID, RG_SEQ, TEAM_ID, PLAYER_ID, GOAL, GOAL_TIME)
VALUES(SEQ_RP_SEQ.NEXTVAL, 1, 5, 1, 1, 1, SYSDATE);
INSERT INTO RECORD_PLAYER(RP_SEQ, SEASON_ID, RG_SEQ, TEAM_ID, PLAYER_ID, GOAL, GOAL_TIME)
VALUES(SEQ_RP_SEQ.NEXTVAL, 1, 5, 3, 15, 1, SYSDATE);

