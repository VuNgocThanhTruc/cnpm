package com.xxbb.dao.impl;

import java.util.ArrayList;
import java.util.List;

import com.xxbb.actionform.BookForm;
import com.xxbb.dao.BookDao;

public class BookDaoImpl extends BaseDaoImpl implements BookDao{
	@Override
	public List<BookForm> query(BookForm bf) {
		// TODO Auto-generated method stub
		List<BookForm> bfs=new ArrayList<BookForm>();
		StringBuffer sb=new StringBuffer();
		BookForm b=null;
		if(bf.getId()==null&&bf.getBookBarcode()==null) {
			sb.append("SELECT b.*,p.publish_name,bt.type_name,bc.name from tb_bookinfo b left join tb_booktype bt  on bt.id=b.type_id join tb_bookcase bc on bc.id=b.bookcase join tb_publishing p on p.isbn=b.ISBN");
			System.out.println("Select info book："+sb);
		}else if(bf.getId()!=null) {
			sb.append("SELECT b.*,p.publish_name,bt.type_name,bc.name from tb_bookinfo b left join tb_booktype bt  on bt.id=b.type_id join tb_bookcase bc on bc.id=b.bookcase join tb_publishing p on p.isbn=b.ISBN where b.id=");
			sb.append(bf.getId());
		}
		try {
			rs=executeQuery(sb.toString());
			while(rs.next()) {
				b=new BookForm();
				b.setId(Integer.parseInt(rs.getString("id")));
				b.setBookBarcode(rs.getString("barcode"));
				b.setBookName(rs.getString("book_name"));
				b.setPublishName(rs.getString(14));
				b.setBookTypeName(rs.getString(15));
				b.setBookcaseName(rs.getString(16));
				
				b.setAuthor(rs.getString(4));
				b.setTranslator(rs.getString(5));
				b.setPrice(rs.getDouble(7));
				b.setPage(rs.getInt(8));
				b.setIntime(rs.getString(10));
				b.setOperator(rs.getString(11));
				bfs.add(b);
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally {
			close();
		}
		return bfs;
	}

	@Override
	public List<BookForm> query(String[] str) {
		// TODO Auto-generated method stub
		List<BookForm> bfs=new ArrayList<BookForm>();
		BookForm b=null;
		StringBuffer sb=new StringBuffer();
		if("publish_name".equals(str[0])) {
			sb.append("SELECT b.*,p.publish_name,bt.type_name,bc.name from tb_publishing p left join tb_bookinfo b on b.ISBN=p.isbn join tb_booktype bt on bt.id=b.type_id join tb_bookcase bc on bc.id=b.bookcase where p.publish_name='");
			sb.append(str[1]);
			sb.append("'");
		}else if("bookcase_name".equals(str[0])) {
			sb.append("SELECT b.*,p.publish_name,bt.type_name,bc.name from tb_bookcase bc left join tb_bookinfo b on bc.id=b.bookcase join tb_booktype bt on bt.id=b.type_id join tb_publishing p on p.isbn=b.ISBN where bc.name='");
			sb.append(str[1]);
			sb.append("'");
		}else if("type_name".equals(str[0])){
			sb.append("SELECT b.*,p.publish_name,bt.type_name,bc.name from tb_booktype bt left join tb_bookinfo b on bt.id=b.type_id join tb_bookcase bc on bc.id=b.bookcase join tb_publishing p on p.isbn=b.ISBN where bt.type_name='");
			sb.append(str[1]);
			sb.append("'");
		}else {
			sb.append("SELECT b.*,p.publish_name,bt.type_name,bc.name from tb_bookinfo b left join tb_booktype bt  on bt.id=b.type_id join tb_bookcase bc on bc.id=b.bookcase join tb_publishing p on p.isbn=b.ISBN where b.");
			sb.append(str[0]);
			sb.append("='");
			sb.append(str[1]);
			sb.append("'");
		}
		try {
			rs=executeQuery(sb.toString());
			while(rs.next()) {
				b=new BookForm();
				b.setId(rs.getInt(13));
				b.setBookBarcode(rs.getString(1));
				b.setBookName(rs.getString(2));
				b.setPublishName(rs.getString(14));
				b.setBookTypeName(rs.getString(15));
				b.setBookcaseName(rs.getString(16));
				bfs.add(b);
				
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally {
			close();
		}
		return bfs;
	}
	@Override
	public List<BookForm> existQuery(BookForm bf) {
		// TODO Auto-generated method stub
		StringBuffer sb=new StringBuffer();
		BookForm b=null;
		List<BookForm> bfs=new ArrayList<BookForm>();
		if(bf.getBookBarcode()!=null) {
			sb.append("select b.*,bb.* from tb_bookinfo b left join tb_bookborrow bb on bb.book_id=b.id where (bb.if_back=1 or bb.if_back is null ) and b.barcode='");
			sb.append(bf.getBookBarcode());
			sb.append("'");
		}else if(bf.getBookName()!=null) {
			sb.append("select b.*,bb.* from tb_bookinfo b left join tb_bookborrow bb on bb.book_id=b.id where (bb.if_back=1 or bb.if_back is null ) and b.book_name='");
			sb.append(bf.getBookName());
			sb.append("'");
		}
		try {
			rs=executeQuery(sb.toString());
			while(rs.next()) {
				b=new BookForm();
				b.setBookBarcode(rs.getString(1));
				b.setId(rs.getInt("id"));
				bfs.add(b);
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally {
			close();
		}
		return bfs;
	}
	@Override
	public int delete(BookForm bf) {
		return 0;
	}

	@Override
	public int insert(BookForm bf) {
		// TODO Auto-generated method stub
		boolean flag=false;
		int result=0;
		StringBuffer sb=new StringBuffer();
		sb.append("select * from tb_bookinfo where barcode='");
		sb.append(bf.getBookBarcode());
		sb.append("'");
		try {
			rs=executeQuery(sb.toString());
			flag=rs.next();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		if(flag) {
			result=-1;

		}else {
			sb.setLength(0);
			sb.append("insert into tb_bookinfo(barcode,book_name,type_id,author,translator,isbn,price,page,bookcase,intime,operator) values");
			sb.append("('");
			sb.append(bf.getBookBarcode());
			sb.append("','");
			sb.append(bf.getBookName());
			sb.append("','");
			sb.append(bf.getBookTypeId());
			sb.append("','");
			sb.append(bf.getAuthor());
			sb.append("','");
			sb.append(bf.getTranslator());
			sb.append("','");
			sb.append(bf.getIsbn());
			sb.append("',");
			sb.append(bf.getPrice());
			sb.append(",'");
			sb.append(bf.getPage());
			sb.append("','");
			sb.append(bf.getBookcaseId());
			sb.append("','");
			sb.append(bf.getIntime());
			sb.append("','");
			sb.append(bf.getOperator());
			sb.append("')");
			try {
//				3.1.5 Insert sách mới vào database
				result=executeUpdate(sb.toString());
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}finally {
				close();
			}
		}

//		3.1.6 return kết quả insert thông tin sách
		return result;
	}
	@Override
	public int update(BookForm bf) {
		// TODO Auto-generated method stub
		int result=0;
		StringBuffer sb=new StringBuffer();
		sb.append("update tb_bookinfo set ");
		sb.append("book_name='");
		sb.append(bf.getBookName());
		sb.append("',type_id=");
		sb.append(bf.getBookTypeId());
		sb.append(",author='");
		sb.append(bf.getAuthor());
		sb.append("',translator='");
		sb.append(bf.getTranslator());
		sb.append("',isbn='");
		sb.append(bf.getIsbn());
		sb.append("',price=");
		sb.append(bf.getPrice());
		sb.append(",page='");
		sb.append(bf.getPage());
		sb.append("',bookcase='");
		sb.append(bf.getBookcaseId());
		sb.append("',operator='");
		sb.append(bf.getOperator());
		sb.append("' where id=");
		sb.append(bf.getId());
		try {
			result=executeUpdate(sb.toString());
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally {
			close();
		}
		return result;
	}
}
