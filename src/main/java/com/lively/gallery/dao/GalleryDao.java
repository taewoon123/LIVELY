package com.lively.gallery.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.lively.gallery.vo.GalleryVo;

@Repository
public class GalleryDao {
	
	public List<GalleryVo> getGalleryList(SqlSessionTemplate sst) {
		return sst.selectList("gallery.getGalleryList");
	}

	public int write(SqlSessionTemplate sst, GalleryVo galleryVo) {
		return sst.insert("gallery.write", galleryVo);
	}

	public GalleryVo getGallery(SqlSessionTemplate sst, String no) {
		return sst.selectOne("gallery.getGallery", no);
	}

	
}
