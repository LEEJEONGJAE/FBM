<%@page language="java" contentType="text/html; charset=UTF-8"%>

<%@page import="java.util.*" %>

<%
HashMap<Integer, String> map = new HashMap<Integer, String>();


map.put(4, "사정재");
map.put(1, "일정재");
map.put(3, "삼정재");
map.put(2, "이정재");


TreeMap<Integer, String> tMap = new TreeMap<Integer, String>(Collections.reverseOrder());

tMap.putAll(map);

Iterator<Integer> tMapIter = tMap.keySet().iterator();

while(tMapIter.hasNext()){
	
	Integer key = tMapIter.next();
	String value = tMap.get(key);

	System.out.println("key[" + key + "][" + value + "]" );
}

%>
