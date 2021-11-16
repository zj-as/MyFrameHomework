package controller;

import org.apache.commons.io.IOUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.URLEncoder;

@RestController
public class FileUploadAndDownloadController {

    @PostMapping(value = "/upload.do", produces = "text/plain;charset=utf-8")
    public String fileUpload(@RequestParam("file") MultipartFile file, HttpSession session) throws IOException {

        // 判断文件是否为空
        if (file.isEmpty()) {
            return "上传文件为空";
        }

        // 获取服务器存储的映射地址
        String path = session.getServletContext().getRealPath("/") + "files\\";
        // 获取原文件名
        String fileName = file.getOriginalFilename();
        // 创建服务器存储的磁盘地址
        File filePath = new File(path, fileName);
        // 如果文件目录不存在，创建目录
        if (!filePath.getParentFile().exists()) {
            filePath.getParentFile().mkdirs();
        }
        // 将上传的文件复制给空白文件
        file.transferTo(filePath);

        return "文件上传成功";
    }

    @GetMapping(value = "/download.do", produces = "text/plain;charset=utf-8")
    public String fileDownload(String fileName, HttpServletResponse response, HttpSession session) throws IOException {

        // 先判断参数是否为空
        if (fileName == null || fileName.length() == 0) {
            return "请输入要下载的文件名";
        }

        // 判断用户输入的文件名是否规范
        String downloadFileName;
        if (fileName.contains(".jpg")) {
            downloadFileName = fileName;
        } else {
            downloadFileName = fileName + ".jpg";
        }

        // 读取要下载的文件内容
        InputStream resourceAsStream =
                session.getServletContext().getResourceAsStream("/files/" + downloadFileName);

        // 判断服务器映射地址中有没有该文件
        if (resourceAsStream == null) {
            return "没有该文件";
        }

        // 获取要下载的文件类型
        String mimeType = session.getServletContext().getMimeType("/files/" + downloadFileName);
        response.setContentType(mimeType);

        // 通过响应头告诉客户端接收到的数据是用于下载的，而不是直接显示在浏览器
        response.setHeader("Content-Disposition",
                "attachment;filename=" + URLEncoder.encode(downloadFileName, "UTF-8"));

        // 获取响应的输出流
        OutputStream outputStream = response.getOutputStream();

        // 读取输入流中全部的数据，复制给输出流，响应给客户端
        IOUtils.copy(resourceAsStream, outputStream);

        // 关闭资源
        resourceAsStream.close();
        outputStream.close();
        return null;
    }

}
