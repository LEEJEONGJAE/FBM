SELECT * FROM PLAYER;

SELECT * FROM SEASON;

SELECT * FROM TEAM;

SELECT * FROM RECORD_GAME;

SELECT * FROM RECORD_PLAYER;

SELECT * FROM SEASON_RANK;

/*
INSERT INTO RECORD_GOALS(RP_SEQ, RG_SEQ, PLAYER_ID, STARTING, GOAL, GOAL_TIME
                         , CHANGE_IN, CHANGE_IN_TIME, CHANGE_OUT, CHANGE_OUT_TIME)
VALUES(SEQ_RP_SEQ.NEXTVAL, 1, 1, SYSDATE);
*/

-- 경기기록 상세_경기기록 
SELECT RG_SEQ
       , (SELECT SEASON_NM FROM SEASON WHERE SEASON_ID = RG.SEASON_ID) SEASON_NM
       , (SELECT TEAM_NM FROM TEAM WHERE TEAM_ID = RG.H_TEAM_ID) H_TEAM_NM
       , (SELECT TEAM_NM FROM TEAM WHERE TEAM_ID = RG.A_TEAM_ID) A_TEAM_NM 
       , NVL((SELECT TEAM_NM FROM TEAM WHERE TEAM_ID = RG.W_TEAM_ID), '무승부') W_TEAM_NM
       , H_TEAM_GOALS
       , A_TEAM_GOALS
FROM RECORD_GAME RG
WHERE RG.RG_SEQ = 4;
-- 경기기록 상세_경기기록


-- 경기기록 상세_선수기록
SELECT RP_SEQ
       , RG_SEQ
       , (SELECT TEAM_NM FROM TEAM WHERE TEAM_ID = RP.TEAM_ID) TEAM_NM
       , (SELECT PLAYER_NM FROM PLAYER WHERE PLAYER_ID = RP.PLAYER_ID) PLAYER_NM
       , STARTING
       , GOAL
       , GOAL_TIME
       , CHANGE_IN
       , CHANGE_IN_TIME
       , CHANGE_OUT
       , CHANGE_OUT_TIME
       , PLAY_TIME
FROM RECORD_PLAYER RP
WHERE RG_SEQ = 1;
-- 경기기록 상세_선수기록

-- 팀상세정보
-- 전적, 승률, 팀원(주장), 팀경기기록

-- 전적, 승률
SELECT SEASON_NM
       , RANK
       , TEAM_NM
       , GAME_CNT
       , W_POINT
       , WIN
       , DRAW
       , LOSE
       , GD
       , GF
       , GA
       , ROUND((WIN / GAME_CNT * 100), 2) WR
FROM SEASON_RANK
WHERE TEAM_NM = '1팀';

-- 팀원
SELECT SS.SEASON_NM SEASON_NM
       , TM.TEAM_NM TEAM_NM
       , P.PLAYER_NM PLAYER_NM
       , P.BACK_NO BACK_NO
FROM SEASON SS
     , TEAM TM
     , PLAYER P
WHERE SS.SEASON_ID = TM.SEASON_ID
AND TM.TEAM_ID = P.TEAM_ID
AND SS.SEASON_ID = 1
AND TM.TEAM_ID = 1;    
     
-- 팀경기기록
SELECT *   
FROM SEASON SS
     , TEAM TM
     , RECORD_GAME RG
WHERE SS.SEASON_ID = TM.SEASON_ID
AND TM.SEASON_ID = RG.SEASON_ID
AND (TM.TEAM_ID = RG.H_TEAM_ID OR TM.TEAM_ID = RG.A_TEAM_ID)
AND TM.TEAM_ID = 3;



SELECT *
FROM RECORD_PLAYER
WHERE PLAYER_ID = 1;


SELECT SEASON_NM
       , GAME_CNT
       , GOALS
       , PLAY_TIME
       , ROUND(GOALS / GAME_CNT, 1) GOAL_PER_GAME
       , ROUND(PLAY_TIME / GOALS, 1) GOAL_PER_TIME
FROM
    (
    SELECT SS.SEASON_NM SEASON_NM
           , COUNT(DISTINCT RP.RG_SEQ) GAME_CNT
           , SUM(RP.GOAL) GOALS
           , SUM(RP.PLAY_TIME) PLAY_TIME
    FROM RECORD_PLAYER RP
         , SEASON SS
         , PLAYER P
    WHERE SS.SEASON_ID = RP.SEASON_ID
    AND P.PLAYER_ID = RP.PLAYER_ID
    AND RP.PLAYER_ID = 1
    AND RP.SEASON_ID = 1
    GROUP BY SS.SEASON_NM
    );
    
    
    
    
    
    
    
SELECT SEASON_NM
       , GAME_CNT
       , GOALS
       , RANK_GOAL
       , PLAY_TIME
       , ROUND(GOALS / GAME_CNT, 1) GOAL_PER_GAME
       , ROUND(PLAY_TIME / GOALS, 1) GOAL_PER_TIME
FROM
    (
    SELECT SS.SEASON_NM SEASON_NM
           , COUNT(DISTINCT RP.RG_SEQ) GAME_CNT
           , SUM(RP.GOAL) GOALS
           , RANK() OVER(ORDER BY SUM(RP.GOAL) DESC) RANK_GOAL
           , SUM(RP.PLAY_TIME) PLAY_TIME
    FROM RECORD_PLAYER RP
         , SEASON SS
         , PLAYER P
    WHERE SS.SEASON_ID = RP.SEASON_ID
    AND P.PLAYER_ID = RP.PLAYER_ID
    AND RP.SEASON_ID = 1
    GROUP BY SS.SEASON_NM
    );