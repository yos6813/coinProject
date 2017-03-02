package org.zerock.service;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.zerock.persistence.Card;
import org.zerock.persistence.CardDAO;

@Service
public class CardServiceImpl implements CardService{

	@Inject
	private CardDAO dao;
	
	@Override
	public void usageCardInsert(Card card) {
		dao.usageCardInsert(card);
	}

	@Override
	public List<Card> usageCardSelect(Card card) {
		return dao.usageCardSelect(card);
	}
	
//	public List<Card> xlsExcelReader(MultipartHttpServletRequest req) {
//		// 반환할 객체를 생성
//		List<Card> list = new ArrayList<>();
//
//		MultipartFile file = req.getFile("excel");
//		HSSFWorkbook workbook = null;
//
//		try {
//			// HSSFWorkbook은 엑셀파일 전체 내용을 담고 있는 객체
//			workbook = new HSSFWorkbook(file.getInputStream());
//	
//			// 탐색에 사용할 Sheet, Row, Cell 객체
//			HSSFSheet curSheet;
//			HSSFRow curRow;
//			HSSFCell curCell;
//			Card vo;
//	
//			// Sheet 탐색 for문
//			for (int sheetIndex = 0; sheetIndex < workbook.getNumberOfSheets(); sheetIndex++) {
//				// 현재 sheet 반환
//				curSheet = workbook.getSheetAt(sheetIndex);
//				// row 탐색 for문
//				for (int rowIndex = 0; rowIndex < curSheet.getPhysicalNumberOfRows(); rowIndex++) {
//					// row 0은 헤더정보이기 때문에 무시
//					if (rowIndex != 0) {
//						curRow = curSheet.getRow(rowIndex);
//						vo = new Card();
//						String value;
//			
//						// row의 첫번째 cell값이 비어있지 않는 경우만 cell탐색
//						if (curRow.getCell(0) != null) {
//							if (!"".equals(curRow.getCell(0).getStringCellValue())) {
//							// cell 탐색 for문
//								for (int cellIndex = 0; cellIndex < curRow.getPhysicalNumberOfCells(); cellIndex++) {
//									curCell = curRow.getCell(cellIndex);
//							
//									if (true) {
//										value = "";
//										// cell 스타일이 다르더라도 String으로 반환 받음
//										switch (curCell.getCellType()) {
//											case HSSFCell.CELL_TYPE_FORMULA:
//												value = curCell.getCellFormula();
//											break;
//											case HSSFCell.CELL_TYPE_NUMERIC:
//												value = curCell.getNumericCellValue() + "";
//											break;
//											case HSSFCell.CELL_TYPE_STRING:
//												value = curCell.getStringCellValue() + "";
//											break;
//											case HSSFCell.CELL_TYPE_BLANK:
//												value = curCell.getBooleanCellValue() + "";
//											break;
//											case HSSFCell.CELL_TYPE_ERROR:
//												value = curCell.getErrorCellValue() + "";
//											break;
//											default:
//												value = new String();
//											break;
//										} // end switch
//								
//										// 현재 colum index에 따라서 vo입력
//											switch (cellIndex) {
//												case 0: // 사용날짜
//													vo.setUsageDate(value);
//												break;
//												case 1: // 카드구분
//													vo.setClassifyCard(value);
//												break;
//												case 2: // 사용자
//													vo.setUsageUser(value);
//												break;
//												case 3: // 사용카드
//													vo.setUsageCard(value);
//												break;
//												case 4: // 매출구분
//													vo.setSales(value);
//												break;
//												case 5: // 이용매장
//													vo.setMemberStore(value);
//												break;
//												case 6: // 금액
//													vo.setCost(value);
//												break;
//												case 7: // 적요1
//													vo.setAbstract1(value);
//												break;
//												case 8: // 적요2
//													vo.setAbstract2(value);
//												break;
//												case 9: // 비고
//													vo.setNote(value);
//												break;
//												default:
//												break;
//											}
//										} // end if
//									} // end for
//									// cell 탐색 이후 vo 추가
//									list.add(vo);
//								} // end
//							} // end if
//						}
//		
//					}
//			}
//		} catch (IOException e) {
//			e.printStackTrace();
//		}
//
//		// 디비에 insert
//		adminAccountsMngMapper.insertExcelTest(list);
//		return list;
//		}
//	
//		public List<Card> xlsxExcelReader(MultipartHttpServletRequest req) {
//		// 반환할 객체를 생성
//		List<Card> list = new ArrayList<>();
//
//		MultipartFile file = req.getFile("excel");
//		XSSFWorkbook workbook = null;
//
//		try {
//		// HSSFWorkbook은 엑셀파일 전체 내용을 담고 있는 객체
//		workbook = new XSSFWorkbook(file.getInputStream());
//
//		// 탐색에 사용할 Sheet, Row, Cell 객체
//		XSSFSheet curSheet;
//		XSSFRow curRow;
//		XSSFCell curCell;
//		ExcelTestVO vo;
//
//		// Sheet 탐색 for문
//		for (int sheetIndex = 0; sheetIndex < workbook.getNumberOfSheets(); sheetIndex++) {
//		// 현재 sheet 반환
//		curSheet = workbook.getSheetAt(sheetIndex);
//		// row 탐색 for문
//		for (int rowIndex = 0; rowIndex < curSheet.getPhysicalNumberOfRows(); rowIndex++) {
//		// row 0은 헤더정보이기 때문에 무시
//		if (rowIndex != 0) {
//		curRow = curSheet.getRow(rowIndex);
//		vo = new ExcelTestVO();
//		String value;
//
//		// row의 첫번째 cell값이 비어있지 않는 경우만 cell탐색
//		if (curRow.getCell(0) != null) {
//		if (!"".equals(curRow.getCell(0).getStringCellValue())) {
//		// cell 탐색 for문
//		for (int cellIndex = 0; cellIndex < curRow.getPhysicalNumberOfCells(); cellIndex++) {
//		curCell = curRow.getCell(cellIndex);
//
//		if (true) {
//		value = "";
//		// cell 스타일이 다르더라도 String으로 반환 받음
//		switch (curCell.getCellType()) {
//		case HSSFCell.CELL_TYPE_FORMULA:
//		value = curCell.getCellFormula();
//		break;
//		case HSSFCell.CELL_TYPE_NUMERIC:
//		value = curCell.getNumericCellValue() + "";
//		break;
//		case HSSFCell.CELL_TYPE_STRING:
//		value = curCell.getStringCellValue() + "";
//		break;
//		case HSSFCell.CELL_TYPE_BLANK:
//		value = curCell.getBooleanCellValue() + "";
//		break;
//		case HSSFCell.CELL_TYPE_ERROR:
//		value = curCell.getErrorCellValue() + "";
//		break;
//		default:
//		value = new String();
//		break;
//		} // end switch
//
//		// 현재 colum index에 따라서 vo입력
//		switch (cellIndex) {
//		case 0: // 아이디
//		vo.setCustId(value);
//		break;
//		case 1: // 이름
//		vo.setCustName(value);
//		break;
//		case 2: // 나이
//		vo.setCustAge(value);
//		break;
//		case 3: // 이메일
//		vo.setCustEmail(value);
//		break;
//		default:
//		break;
//		}
//		} // end if
//		} // end for
//		// cell 탐색 이후 vo 추가
//		list.add(vo);
//		} // end
//		} // end if
//		}
//
//		}
//		}
//		} catch (IOException e) {
//		e.printStackTrace();
//		}
//
//		// 디비에 insert
//		adminAccountsMngMapper.insertExcelTest(list);
//		return list;
//		}
}
