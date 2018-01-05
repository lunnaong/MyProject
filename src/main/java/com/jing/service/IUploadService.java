package com.jing.service;

import org.springframework.web.multipart.MultipartFile;

public interface IUploadService {
public boolean batchImport(String name,MultipartFile file);
}
