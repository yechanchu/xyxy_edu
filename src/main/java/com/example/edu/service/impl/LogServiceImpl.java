package com.example.edu.service.impl;

import com.example.edu.entity.Log;
import com.example.edu.mapper.LogMapper;
import com.example.edu.service.LogService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@Service
public class LogServiceImpl implements LogService {


    @Autowired
    private LogMapper mapper;


    @Override
    public void export(HttpServletResponse response) throws IOException {
        //获取数据
        List<Log> logs = mapper.findAll();

        //导出
        Workbook wb = new HSSFWorkbook();

        Sheet sheet = wb.createSheet();

        Row row = sheet.createRow(0);

        Cell cell = row.createCell(0);

        cell.setCellValue("序号");
        cell = row.createCell(1);
        cell.setCellValue("账号");
        cell = row.createCell(2);
        cell.setCellValue("名称");
        cell = row.createCell(3);
        cell.setCellValue("IP");
        cell = row.createCell(4);
        cell.setCellValue("时间");
        cell = row.createCell(5);
        cell.setCellValue("描述");

        for (int i = 0; i < logs.size(); i++) {
            Log log = logs.get(i);
            row = sheet.createRow(i + 1);

            cell = row.createCell(0);
            cell.setCellValue(i + 1);

            cell = row.createCell(1);
            cell.setCellValue(log.getAccount());

            cell = row.createCell(2);
            cell.setCellValue(log.getOperator());

            cell = row.createCell(3);
            cell.setCellValue(log.getIp());

            cell = row.createCell(4);
            cell.setCellValue(log.getCreate_time());

            cell = row.createCell(5);
            cell.setCellValue(log.getDescription());
        }

        response.setHeader("content-disposition", "attachment;filename=log.xls");

        ServletOutputStream outputStream = response.getOutputStream();
        wb.write(outputStream);
        outputStream.close();
        wb.close();

    }

    @Override
    public PageInfo listPage(Integer currentPage, Integer pageSize) {
        //指定该页所需的信息数
        PageHelper.startPage(currentPage, pageSize);
        PageInfo pageInfo = new PageInfo(mapper.findAll());
        return pageInfo;
    }

    @Override
    public List<Log> findAll() {
        return mapper.findAll();
    }

    @Override
    public void save(Log log) {
        mapper.save(log);

    }
}
