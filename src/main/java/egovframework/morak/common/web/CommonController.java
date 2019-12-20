package egovframework.morak.common.web;

import java.io.File;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import egovframework.morak.common.service.CommonService;
import egovframework.rte.psl.dataaccess.util.EgovMap;


@Controller
public class CommonController {
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="commonService")
	private CommonService commonService;
	
	@Resource(name = "uploadPath")
	private String uploadPath;
	
	@RequestMapping(value="/common/downloadFile.do")
	public void downloadFile(@RequestParam HashMap<String, Object> prm, HttpServletResponse response) throws Exception{
		Map<String,Object> map = commonService.selectFileInfo(prm);
		String storedFileName = (String)map.get("storedFileName");
		String originalFileName = (String)map.get("originalFileName");
		
		byte fileByte[] = FileUtils.readFileToByteArray(new File(uploadPath+"/"+storedFileName));
		
		response.setContentType("application/octet-stream");
		response.setContentLength(fileByte.length);
		response.setHeader("Content-Disposition", "attachment; fileName=\"" + URLEncoder.encode(originalFileName,"UTF-8")+"\";");
		response.setHeader("Content-Transfer-Encoding", "binary");
		response.getOutputStream().write(fileByte);
		
		response.getOutputStream().flush();
		response.getOutputStream().close();
	}
}
