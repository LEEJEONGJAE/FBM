package fbm.main.controller;

import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Map.Entry;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.junit.runners.Parameterized.Parameters;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import fbm.cmm.dao.SeasonService;
import fbm.cmm.dao.UserService;
import fbm.cmm.model.SeasonVO;
import fbm.cmm.model.UserVO;
import fbm.common.common.CommandMap;

@Controller
public class MainController {
    Logger log = Logger.getLogger(this.getClass());
    
    @Autowired
    private UserService usrService;
    
    @Autowired
    private SeasonService ssService;
    
    @RequestMapping(value="/")
    public ModelAndView openSampleList(Map<String,Object> commandMap) throws Exception{
        ModelAndView mv = new ModelAndView("home");
//        ModelAndView mv = new ModelAndView("index");
        log.debug("인터셉터 테스트");
        
        return mv;
    }
    
    @RequestMapping(value="/sample/testMapArgumentResolver.do")
    public ModelAndView testMapArgumentResolver(CommandMap commandMap) throws Exception{
        ModelAndView mv = new ModelAndView("");
         
        if(commandMap.isEmpty() == false){
            Iterator<Entry<String,Object>> iterator = commandMap.getMap().entrySet().iterator();
            Entry<String,Object> entry = null;
            while(iterator.hasNext()){
                entry = iterator.next();
                log.debug("key : "+entry.getKey()+", value : "+entry.getValue());
            }
        }
        return mv;
    }
    
    @RequestMapping(value="/login.do", method=RequestMethod.POST)
    public ModelAndView login(Map<String,Object> commandMap
    						  , @RequestParam("id") String id
    						  , @RequestParam("pw") String pw) throws Exception{
    	
        log.debug("로그인");

        Map<String, Object> resultMap = new HashMap();
        
        UserVO usrVO = new UserVO();
        usrVO.setId(id);
        usrVO.setPw(pw);
        
        int result = usrService.login(usrVO);
        
        log.debug("result : " + result);
        
        if(result == 1){
	        resultMap.put("result_code", "1");
	        resultMap.put("result_message", "success");
        }else{
        	resultMap.put("result_code", "0");
        	resultMap.put("result_message", "fail");
        }
        ModelAndView mv = new ModelAndView("jsonView", resultMap);
        
        return mv;
    }
    
    @RequestMapping(value="/joinUser.do", method=RequestMethod.POST)
    public ModelAndView join(Map<String,Object> commandMap
    						  , @ModelAttribute UserVO usrVO) throws Exception{
    	
    	log.debug("회원가입");
    	
    	Map<String, Object> resultMap = new HashMap();
    	
    	int result = usrService.joinUser(usrVO);
    	
    	log.debug("joinUser result : " + result);
    	
    	if(result == 1){
    		resultMap.put("result_code", "1");
    		resultMap.put("result_message", "success");
    	}else{
    		resultMap.put("result_code", "0");
    		resultMap.put("result_message", "fail");
    	}
    	ModelAndView mv = new ModelAndView("jsonView", resultMap);
    	
    	return mv;
    }
    
    
    @RequestMapping(value="/registSeason.do", method=RequestMethod.POST)
    public ModelAndView registSeason(Map<String,Object> commandMap
    		, @ModelAttribute SeasonVO ssVO, String user_id) throws Exception{
    	
    	log.debug("새시즌 등록");
    	
    	Map<String, Object> resultMap = new HashMap();
    	
    	ssVO.setManager_id(user_id);
    	
    	int result = ssService.registSeason(ssVO);
    	
    	log.debug("resistSeason result : " + result);
    	
    	if(result == 1){
    		resultMap.put("result_code", "1");
    		resultMap.put("result_message", "success");
    	}else{
    		resultMap.put("result_code", "0");
    		resultMap.put("result_message", "fail");
    	}
    	ModelAndView mv = new ModelAndView("jsonView", resultMap);
    	
    	return mv;
    }
    
    @RequestMapping(value="/getSeasonInfo.do", method=RequestMethod.POST)
    public ModelAndView getSeasonInfo(Map<String,Object> commandMap
    		, String season_id, String user_id) throws Exception{
    	
    	log.debug("새시즌 정보");
    	
    	Map<String, Object> resultMap = new HashMap();
    	
    	Map<String, String> paramSet = new HashMap();
    	
    	paramSet.put("season_id", season_id);
    	paramSet.put("manager_id", user_id);
    	
    	SeasonVO ssVO = null;
    	
    	ssVO = ssService.getSeasoninfo(paramSet);
    	
    	log.debug("resistSeason result : ");
    	
    	if(ssVO == null){
    		resultMap.put("result_code", "0");
    		resultMap.put("result_message", "fail");
    		resultMap.put("ssVO", "");
    	}else{
    		resultMap.put("result_code", "1");
    		resultMap.put("result_message", "success");
    		resultMap.put("ssVO", ssVO);
    	}
    	ModelAndView mv = new ModelAndView("jsonView", resultMap);
    	
    	return mv;
    }
    

}