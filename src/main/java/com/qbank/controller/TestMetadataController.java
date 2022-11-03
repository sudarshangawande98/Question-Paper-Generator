package com.qbank.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.InputStreamResource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.lowagie.text.Document;
import com.lowagie.text.DocumentException;
import com.lowagie.text.Element;
import com.lowagie.text.Font;
import com.lowagie.text.FontFactory;
import com.lowagie.text.Image;
import com.lowagie.text.PageSize;
import com.lowagie.text.Paragraph;
import com.lowagie.text.Phrase;
import com.lowagie.text.Rectangle;
import com.lowagie.text.pdf.PdfPCell;
import com.lowagie.text.pdf.PdfPTable;
import com.lowagie.text.pdf.PdfWriter;
import com.qbank.entity.PdfQuestion;
import com.qbank.entity.QuestionMaster;
import com.qbank.entity.TestMaster;
import com.qbank.entity.TestMetaData;
import com.qbank.repository.QuestionRepository;
import com.qbank.repository.TopicRepository;
import com.qbank.service.DifficultyLevelService;
import com.qbank.service.TestMetaDataService;
import com.qbank.serviceimpl.PdfQuestionServiceImpl;
import com.qbank.serviceimpl.QuestionServiceImpl;
import com.qbank.serviceimpl.SubjectServiceImpl;
import com.qbank.serviceimpl.TestServiceImpl;

import lombok.extern.java.Log;

@Log
@Controller
public class TestMetadataController {
	
	@Autowired
	TestServiceImpl testService;

	@Autowired
	SubjectServiceImpl subjectService;

	@Autowired
	QuestionRepository questionRepository;
	
	@Autowired
	TopicRepository topicRepository;

	@Autowired
	DifficultyLevelService difficultyLevelService;
	
	@Autowired
	 TestMetaDataService testMetaDataService;
	
	@Autowired
	QuestionServiceImpl questionServiceImpl;
	
	@Autowired
	PdfQuestionServiceImpl pdfQuestionService;
	
	@RequestMapping("/testmetadata")
	public ModelAndView testForm(ModelAndView mv, Model m) {
		List<TestMetaData> testList = testMetaDataService.getAllTestMetaData();
		m.addAttribute("testList", testList);
		return mv;
	}

	@RequestMapping(value = "/downloadTest/{testMetaDataId}", method = RequestMethod.GET)
	public ResponseEntity<Object> downloadFile(@PathVariable Integer testMetaDataId) throws IOException {
		TestMetaData testMetaData = testMetaDataService.getTestMetaData(testMetaDataId).get();
		String filename = testMetaData.getTestPath();
		File file = new File(filename);
		InputStreamResource resource = new InputStreamResource(new FileInputStream(file));

		HttpHeaders headers = new HttpHeaders();
		headers.add("Content-Disposition", String.format("attachment; filename=\"%s\"", file.getName()));
		headers.add("Cache-Control", "no-cache, no-store, must-revalidate");
		headers.add("Pragma", "no-cache");
		headers.add("Expires", "0");

		ResponseEntity<Object> responseEntity = ResponseEntity.ok().headers(headers).contentLength(file.length())
				.contentType(MediaType.parseMediaType("application/txt")).body(resource);

		return responseEntity;
	}
	
	@RequestMapping(value ="/deleteTest/{testMetaDataId}")
	public ModelAndView deleteTest(@PathVariable Integer testMetaDataId,ModelAndView mv,Model m) {
		
		boolean flag=testMetaDataService.deleteTest(testMetaDataId);
		String deleteMsg =null;
		if(flag == true) {
			
			deleteMsg ="File Deleted Sucesfully";
		}
		else {
			deleteMsg ="File Not found";
		}
		List<TestMetaData> testList = testMetaDataService.getAllTestMetaData();
		m.addAttribute("testList", testList);
		mv.addObject("deleteMsg", deleteMsg);
		mv = new  ModelAndView("testmetadata");
		return mv;	
	}
	
	@RequestMapping("/pdf")
    public ModelAndView exportToPDF(HttpServletResponse response,@RequestParam(name="hiddenData") String hiddenData,ModelAndView mv,Model m) throws DocumentException, IOException {
		
		try { 
			int mark=0;
			int duration=0;
			int count=0;
			int count1=0;
			int count2=0;
			String subjectName="";
			TestMaster testId = null;
			final ObjectMapper objectMapper = new ObjectMapper();

			TestMaster[] testList = objectMapper.readValue(hiddenData, TestMaster[].class);
				
			List<TestMaster> testList1 = new ArrayList<TestMaster>(Arrays.asList(testList));
				
			int sum1=0,sum=0;
		    List<QuestionMaster> list = new ArrayList<QuestionMaster>();
		    
		    for (TestMaster testMaster: testList1) {
		    	
		    	testId=testService.createTest(testMaster);
				duration=testMaster.getDuration();
				int subjectId = testMaster.getSubjectMaster().getSubjectId();

				int topicId = testMaster.getTopicMaster().getTopicId();
				subjectName=testMaster.getSubjectMaster().getSubjectName();
				int hardQuestions = testMaster.getTotalNoOfHardQuestion();
				int	lowQuestions = testMaster.getTotalNoOfLowQuestion();
				int mediumQuestions = testMaster.getTotalNoOfMediumQuestion();

				sum1=hardQuestions+lowQuestions+mediumQuestions;
				sum=sum+sum1;
		  
				count=questionRepository.countHardQuestion(subjectId, topicId,3);
				System.out.println("***count hard question "+count);
				count1=questionRepository.countMediumQuestion(subjectId, topicId, 2);
				System.out.println("count medium question "+count1);
				count2=questionRepository.countLowQuestion(subjectId, topicId, 1);
				System.out.println("count low question "+count2+" ***");
				
		        List<QuestionMaster> list1 = questionRepository.findRandHardQuestions(subjectId,topicId,3,hardQuestions);
				List<QuestionMaster> list2 = questionRepository.findRandLowQuestions(subjectId, topicId, 1, lowQuestions);
				List<QuestionMaster> list3 = questionRepository.findRandMediumQuestions(subjectId, topicId, 2, mediumQuestions);
				
				list.addAll(list1); //hardQuestions
				list.addAll(list2); //lowQuestions
				list.addAll(list3); //mediumQuestions

				m.addAttribute("duration", testMaster.getDuration());
		    }
				
		    Collections.shuffle(list);
			response.setContentType("application/pdf");
	        DateFormat dateFormatter = new SimpleDateFormat("yyyy-MM-dd_HH:mm:ss");
	        String currentDateTime = dateFormatter.format(new Date());
	        String dir = System.getProperty("user.dir");

	        String documentRootPath =  dir+ "\\src\\main\\webapp\\WEB-INF\\TestPdf\\";
	        
	        String documentPath1 = subjectName+"_" + currentDateTime   +".pdf";
	        String  documentPath = documentRootPath + documentPath1.replace(":", "_");
	        
	        Document document = new Document(PageSize.A4);
	        PdfWriter.getInstance(document, new FileOutputStream(documentPath));
	        document.open();
	        Image imageCenter = Image.getInstance("logo.jpg");
	        imageCenter.scaleToFit(260, 260);
	        imageCenter.setAlignment(Image.MIDDLE);
	        
	        document.add(imageCenter);
	        
	        Font font = FontFactory.getFont(FontFactory.HELVETICA_BOLD);
	        font.setSize(16);
		         
		    Paragraph p = new Paragraph("MCQ Preparation Test",font);
		    p.setAlignment(Paragraph.ALIGN_CENTER);
		    document.add(p);
		     
		    Font font1 = FontFactory.getFont(FontFactory.HELVETICA_BOLD);
		    font1.setSize(13);
		    Paragraph p1 = new Paragraph("Subject:"+subjectName,font1);
		    p1.setAlignment(Paragraph.ALIGN_CENTER);
		    document.add(p1);
		    
		    for (QuestionMaster question1 : list) {
		    	mark+=question1.getMarks();
		    }
		     
		    String duration1="Duration:"+duration+" Hours";
		    String marks="Total Marks : "+mark;
		      
		    PdfPTable table1 = new PdfPTable(2);
	        table1.setWidthPercentage(100);
	        table1.setWidths(new int[]{1,2});
	        table1.addCell(createTextCell1(duration1));
	        table1.addCell(createTextCell(marks));
	        document.add(table1);
		    PdfPTable table2 = new PdfPTable(1);

		    PdfPTable table3 = new PdfPTable(2);
	        table3.setWidthPercentage(100);
	       
	        table3.setWidths(new int[]{300,50});
	     
	        int i=1;
	        PdfPCell cell1 = new PdfPCell();
	        cell1.setBorder(Rectangle.NO_BORDER);

	        document.add(new Phrase("\n"));
	        
	        for (QuestionMaster question : list) {
		     
			   table3.addCell(createTextCell1(""+i+")"+" "+question.getQuestion()));
			   table3.addCell(createTextCell(Integer.toString(question.getMarks())));
			   table3.addCell(createTextCell1(""+"A)"+" "+question.getOption1()));
			   table3.addCell(cell1);
			   table3.addCell(createTextCell1(""+"B)"+" "+question.getOption2()));
			   table3.addCell(cell1);		  
			   table3.addCell(createTextCell1(""+"C)"+" "+question.getOption3()));
			   table3.addCell(cell1);
			   table3.addCell(createTextCell1(""+"D)"+" "+question.getOption4()+"\n\n"));
			   table3.addCell(cell1);
	        
			   i++;
		       document.add(table2);  
	        }

	        document.add(table3); 
	        TestMetaData testMetadata=new TestMetaData();
	        testMetadata.setTestPath(documentPath);
	        testMetadata.setTestName(documentPath1);
	        testMetadata.setTestId(testId.getTestId());
	        TestMetaData a=testMetaDataService.save(testMetadata);
	        document.close();	        

	        m.addAttribute("list", list);
	        m.addAttribute("count", count);
	        m.addAttribute("count1", count1);
			m.addAttribute("count2", count2);
	        mv = new ModelAndView("testGenrate");
		    for ( QuestionMaster qm: list) {
		    	PdfQuestion pdfQuestion=new PdfQuestion();
			    pdfQuestion.setPdfQuestion(qm.getQuestion());
			    pdfQuestion.setQuestionId(qm.getQuestionId());
			    pdfQuestion.setTestMetaDataId(a.getTestMetaDataId());
			    pdfQuestion.setTestId(testId.getTestId());
			    pdfQuestionService.createPdfQuestion(pdfQuestion);
		    }
			
		}catch(Exception e) {
			mv = new ModelAndView("redirect:/generate_question1");
			System.out.println("aaaaaaaaaaaaa");
		}
	    return mv;   
    }

	//Create cell for question marks printing
	public static PdfPCell createTextCell(String text) throws DocumentException, IOException {
        PdfPCell cell = new PdfPCell();
        Font font = FontFactory.getFont(FontFactory.HELVETICA);
        font.setSize(15);
        Paragraph p = new Paragraph(text,font);
        p.setAlignment(Element.ALIGN_RIGHT);
        cell.addElement(p);
        cell.setVerticalAlignment(Element.ALIGN_BOTTOM);
        cell.setBorder(Rectangle.NO_BORDER);
        return cell;
    }
	    
	// Created text cell for question and option printing  
	public static PdfPCell createTextCell1(String text) throws DocumentException, IOException {
	    PdfPCell cell = new PdfPCell();
	    Font font = FontFactory.getFont(FontFactory.HELVETICA);
	    font.setSize(15);
	    Paragraph p = new Paragraph(text,font);
	    
	    p.setAlignment(Element.ALIGN_LEFT);
	    cell.addElement(p);
	    cell.setVerticalAlignment(Element.ALIGN_BOTTOM);
	    cell.setBorder(Rectangle.NO_BORDER);
	    return cell;
    }
}
