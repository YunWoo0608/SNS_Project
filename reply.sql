
CREATE TABLE reply
(replyNo INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
r_memberId VARCHAR(30) NOT NULL,
FOREIGN KEY(r_memberId) REFERENCES member(memberId) ON UPDATE CASCADE ON DELETE CASCADE, 
replyContent   VARCHAR(300) NOT NULL,
r_pageNo INT NOT NULL,
FOREIGN KEY(r_pageNo) REFERENCES page(pageNo) ON UPDATE CASCADE ON DELETE CASCADE,
r_replyNo INT,
FOREIGN KEY(r_replyNo) REFERENCES reply(replyNo),
r_replyCount INT DEFAULT 1,
replyReg TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);
ALTER TABLE reply AUTO_INCREMENT=1;



INSERT INTO reply(r_memberId,replyContent,r_pageNo,r_replyCount)
VALUES('chldbsdn','와~~ 정말 흥미로운 게시물이네요~~',1,2);
INSERT INTO reply(r_memberId,replyContent,r_pageNo,r_replyNo,r_replyCount)
VALUES('chldbsdn','와~~ 정말 흥미로운 게시물이네요~~',1,1,2);
INSERT INTO reply(r_memberId,replyContent,r_pageNo,r_replyNo,r_replyCount)
VALUES('chldbsdn','와~~ 정말 흥미로운 게시물이네요~~',1,2,2);
INSERT INTO reply(r_memberId,replyContent,r_pageNo,r_replyNo,r_replyCount)
VALUES('chldbsdn','와~~ 정말 흥미로운 게시물이네요~~',1,3,2);
INSERT INTO reply(r_memberId,replyContent,r_pageNo,r_replyNo,r_replyCount)
VALUES('chldbsdn','와~~ 정말 흥미로운 게시물이네요~~',1,3,1);