package com.nesh.jdo;


import java.util.Date;

import com.google.appengine.api.blobstore.BlobKey;
import com.google.appengine.api.datastore.Key;

import javax.jdo.annotations.IdGeneratorStrategy;
import javax.jdo.annotations.IdentityType;
import javax.jdo.annotations.NotPersistent;
import javax.jdo.annotations.PersistenceCapable;
import javax.jdo.annotations.Persistent;
import javax.jdo.annotations.PrimaryKey;

/**
 * JDO-annotated model class for storing movie properties; movie's promotional
 * image is stored as a Blob (large byte array) in the image field.
 */
@PersistenceCapable(identityType = IdentityType.APPLICATION)
public class ImageJDO {

    @PrimaryKey
    @Persistent(valueStrategy = IdGeneratorStrategy.IDENTITY)
    private Key key;

    @Persistent
    private String title;
    @Persistent
    private String relationTypeId;
    @Persistent
    private String imageId;

    @Persistent
    private String imageType;
    
    @Persistent
    private String imageDescription;
    
    @Persistent
    private String shapeValue;
    
    @Persistent
    private String status;

    @Persistent
    private BlobKey bolbkey;
   
    @Persistent
    private Date currentDate;
    
    @NotPersistent
    private String url;
   


    public Long getId() {
        return key.getId();
    }

    public String getTitle() {
        return title;
    }

    public String getImageType() {
        return imageType;
    }

   

    public BlobKey getBolbkey() {
		return bolbkey;
	}

	public void setBolbkey(BlobKey blobKey) {
		this.bolbkey = blobKey;
	}

	public void setTitle(String title) {
        this.title = title;
    }

    public void setImageType(String imageType) {
        this.imageType = imageType;
    }

    
	public String getRelationTypeId() {
		return relationTypeId;
	}

	public void setRelationTypeId(String relationTypeId) {
		this.relationTypeId = relationTypeId;
	}

	public String getImageId() {
		return imageId;
	}

	public void setImageId(String imageId) {
		this.imageId = imageId;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public String getImageDescription() {
		return imageDescription;
	}

	public void setImageDescription(String imageDescription) {
		this.imageDescription = imageDescription;
	}

	public String getShapeValue() {
		return shapeValue;
	}

	public void setShapeValue(String shapeValue) {
		this.shapeValue = shapeValue;
	}

	public Date getCurrentDate() {
		return currentDate;
	}

	public void setCurrentDate(Date currentDate) {
		this.currentDate = currentDate;
	}
	
	

    
}