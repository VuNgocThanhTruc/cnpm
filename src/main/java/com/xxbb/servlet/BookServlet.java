package com.xxbb.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.xxbb.actionform.BookForm;
import com.xxbb.actionform.BookTypeForm;
import com.xxbb.actionform.BookcaseForm;
import com.xxbb.actionform.PublishingForm;
import com.xxbb.dao.BookDao;
import com.xxbb.dao.BookTypeDao;
import com.xxbb.dao.BookcaseDao;
import com.xxbb.dao.PublishingDao;
import com.xxbb.dao.impl.BookDaoImpl;
import com.xxbb.dao.impl.BookTypeDaoImpl;
import com.xxbb.dao.impl.BookcaseDaoImpl;
import com.xxbb.dao.impl.PublishingDaoImpl;
import com.xxbb.util.TimeUtil;

/**
 * Servlet implementation class BookServlet
 */
@WebServlet("/book")
public class BookServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private BookTypeDao btd = null;
	private BookDao bookDao = null;
	private PublishingDao pd = null;
	private BookcaseDao bcd = null;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public BookServlet() {
		btd = new BookTypeDaoImpl();
		bookDao = new BookDaoImpl();
		pd = new PublishingDaoImpl();
		bcd = new BookcaseDaoImpl();
	}

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		resp.setContentType("text/html; charset=utf-8");
		
		String action = req.getParameter("action");
		if ("bookTypeQuery".equals(action)) {
			bookTypeQuery(req, resp);
		} else if ("bookTypeAdd".equals(action)) {
			bookTypeAdd(req, resp);
		} else if ("bookTypeDel".equals(action)) {
			bookTypeDelete(req, resp);
		} else if ("bookTypeModifyQuery".equals(action)) {
			bookTypeModifyQuery(req, resp);
		} else if ("bookTypeModify".equals(action)) {
			bookTypeModify(req, resp);
		} else if ("bookQuery".equals(action)) {
			bookQuery(req, resp);
		} else if ("bookAddQuery".equals(action)) {
			//	1.2 Gọi bookAddQuery(HttpServletRequest req, HttpServletResponse resp)
			bookAddQuery(req, resp);
		} else if ("bookAdd".equals(action)) {
			//3.1.2 Gọi bookAdd(HttpServletRequest req, HttpServletResponse resp)
			bookAdd(req, resp);
		} else if ("bookDetail".equals(action)) {
			bookDetail(req, resp);
		} else if ("bookQueryAll".equals(action)) {
			bookQueryAll(req, resp);
		} else if ("bookModifyQuery".equals(action)) {
			bookModifyQuery(req, resp);
		} else if ("bookModify".equals(action)) {
			bookModify(req, resp);
		} else if ("bookInfoQuery".equals(action)) {
			bookInfoQuery(req, resp);
		} else if ("bookDel".equals(action)) {
			bookDel(req, resp);
		}
	}

	private void bookTypeQuery(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		List<BookTypeForm> btfs = btd.query(new BookTypeForm());
		if (btfs.isEmpty()) {
			req.setAttribute("fflag", "no");
			req.getRequestDispatcher("bookType.jsp").forward(req, resp);
		} else {
			req.setAttribute("fflag", "yes");
			req.setAttribute("btfs", btfs);
			req.getRequestDispatcher("bookType.jsp").forward(req, resp);
		}
	}

	private void bookTypeAdd(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int result = 0;
		BookTypeForm btf = new BookTypeForm();

		btf.setTypeName(req.getParameter("typeName"));
		btf.setLimitedTime(Integer.valueOf(req.getParameter("time")));

		result = btd.insert(btf);
		if (result == 0) {
			req.setAttribute("error", "Không thể thêm thông tin loại sách!");
			req.getRequestDispatcher("error.jsp").forward(req, resp);
		} else if (result == -1) {
			req.setAttribute("error", "Thông tin loại sách đã được thêm vào!");
			req.getRequestDispatcher("error.jsp").forward(req, resp);
		} else {
			req.getRequestDispatcher("bookType_ok.jsp?para=1").forward(req, resp);
		}

	}
    //    Nguyễn Thanh Liêm 
	// 2.Book.jsp gởi thông tin id của sách đó lên bookservlet và gọi hàm bookTypeDelete() 
	private void bookTypeDelete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int result = 0;
		BookTypeForm btf = new BookTypeForm();

		btf.setId(Integer.valueOf(req.getParameter("id")));

		result = btd.delete(btf);
		if (result == 0) {
			req.setAttribute("error", "Không thể xóa thông tin loại sách!");
		// 3.2 Nếu thất bại thì trả về trang error.jsp 
			req.getRequestDispatcher("error.jsp").forward(req, resp);
		} else {
			//  3.1 Trả về thông báo thành công tới trang bookType_ok.jsp  
			req.getRequestDispatcher("bookType_ok.jsp?para=3").forward(req, resp);
		}
	}

	private void bookTypeModifyQuery(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		req.setAttribute("id", req.getParameter("id"));
		req.setAttribute("name", req.getParameter("name"));
		req.setAttribute("time", req.getParameter("time"));
		req.getRequestDispatcher("bookType_Modify.jsp").forward(req, resp);
	}

	private void bookTypeModify(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int result = 0;
		BookTypeForm btf = new BookTypeForm();
		btf.setId(Integer.valueOf(req.getParameter("id")));
		btf.setLimitedTime(Integer.valueOf(req.getParameter("time")));

		result = btd.update(btf);
		if (result == 0) {
			req.setAttribute("error", "Không thể sửa đổi thông tin loại sách!");
			req.getRequestDispatcher("error.jsp").forward(req, resp);
		} else {
			req.getRequestDispatcher("bookType_ok.jsp?para=2").forward(req, resp);
		}
	}

	private void bookQuery(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String[] funcs = new String[2];

		funcs[0] = req.getParameter("f");
		funcs[1] = req.getParameter("key");

		List<BookForm> bfs = bookDao.query(funcs);
		if (bfs.isEmpty()) {
			req.setAttribute("func", funcs[0]);
			req.setAttribute("value", funcs[1]);
			req.setAttribute("fflag", "no");
			req.getRequestDispatcher("bookQuery.jsp").forward(req, resp);
		} else {
			req.setAttribute("func", funcs[0]);
			req.setAttribute("value", funcs[1]);
			req.setAttribute("bfs", bfs);
			req.getRequestDispatcher("bookQuery.jsp").forward(req, resp);
		}

	}

	private void bookQueryAll(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		List<BookForm> bfs = bookDao.query(new BookForm());
		if (bfs.isEmpty()) {
			req.setAttribute("fflag", "no");
			req.getRequestDispatcher("bookQuery.jsp").forward(req, resp);
		} else {
			req.setAttribute("bfs", bfs);
			req.getRequestDispatcher("bookQuery.jsp").forward(req, resp);
		}

	}

	private void bookDetail(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		BookForm bf = new BookForm();
		bf.setId(Integer.valueOf(req.getParameter("id")));
		List<BookForm> bfs = bookDao.query(bf);
		if (bfs.isEmpty()) {
			req.setAttribute("error", "Đã xảy ra lỗi khi xem thông tin cụ thể của cuốn sách, vui lòng thử lại!");
			req.getRequestDispatcher("error.jsp").forward(req, resp);
		} else {
			req.setAttribute("b", bfs.get(0));
			req.getRequestDispatcher("book_detail.jsp").forward(req, resp);
		}
	}

	private void bookModifyQuery(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {

		List<BookTypeForm> btfs = btd.query(new BookTypeForm());
		List<PublishingForm> pfs = pd.query(new PublishingForm());
		List<BookcaseForm> bcfs = bcd.query(new BookcaseForm());

		BookForm bf = new BookForm();
		bf.setId(Integer.valueOf(req.getParameter("id")));
		List<BookForm> bfs = bookDao.query(bf);
		if (btfs.isEmpty() || bcfs.isEmpty() || bfs.isEmpty() || pfs.isEmpty()) {
			req.setAttribute("error", "Đã xảy ra lỗi khi nhập trang sửa đổi thông tin sách, vui lòng thử lại!");
			req.getRequestDispatcher("error.jsp").forward(req, resp);
		} else {
			req.setAttribute("b", bfs.get(0));
			req.setAttribute("bcfs", bcfs);
			req.setAttribute("btfs", btfs);
			req.setAttribute("pfs", pfs);
			req.getRequestDispatcher("book_Modify.jsp").forward(req, resp);
		}

	}

	private void bookModify(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int result = 0;
		BookForm bf = new BookForm();
		HttpSession hs = req.getSession();

		bf.setId(Integer.valueOf(req.getParameter("id")));
		bf.setBookBarcode(req.getParameter("barcode"));
		bf.setBookName(req.getParameter("bookName"));
		bf.setBookTypeId(Integer.valueOf(req.getParameter("typeId")));
		bf.setAuthor(req.getParameter("author"));
		bf.setTranslator(req.getParameter("translator"));
		bf.setIsbn((req.getParameter("isbn")));
		bf.setPrice(Double.valueOf(req.getParameter("price")));
		bf.setPage(Integer.valueOf(req.getParameter("page")));
		bf.setBookcaseId(Integer.valueOf(req.getParameter("bookcaseid")));
		bf.setOperator((String) hs.getAttribute("username"));
		result = bookDao.update(bf);
		if (result == 0) {
			req.setAttribute("error", "Không thể sửa đổi thông tin sách, vui lòng thử lại! !");
			req.getRequestDispatcher("error.jsp").forward(req, resp);
		} else if (result == -1) {
			req.setAttribute("error", "Mã vạch sách đã tồn tại, vui lòng sửa đổi nó! !");
			req.getRequestDispatcher("error.jsp").forward(req, resp);
		} else {
			req.getRequestDispatcher("book_ok.jsp?para=2").forward(req, resp);
		}
	}

	private void bookDel(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int result = 0;
		BookForm bf = new BookForm();
		bf.setId(Integer.valueOf(req.getParameter("id")));
		result = bd.delete(bf);
		if (result == 0) {
			req.setAttribute("error", "Không thể xóa thông tin sách, vui lòng thử lại! !");
			req.getRequestDispatcher("error.jsp").forward(req, resp);
		} else {
			req.getRequestDispatcher("book_ok.jsp?para=3").forward(req, resp);
		}
	}

	private void bookInfoQuery(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		List<BookForm> bfs = bookDao.query(new BookForm());
		if (bfs.isEmpty()) {
			req.setAttribute("fflag", "no");
			req.getRequestDispatcher("book.jsp").forward(req, resp);
		} else {
			req.setAttribute("bfs", bfs);
			req.getRequestDispatcher("book.jsp").forward(req, resp);
		}
	}

	private void bookAddQuery(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		List<BookTypeForm> btfs = btd.query(new BookTypeForm());
		List<PublishingForm> pfs = pd.query(new PublishingForm());
		List<BookcaseForm> bcfs = bcd.query(new BookcaseForm());
		if (btfs.isEmpty() || bcfs.isEmpty() || pfs.isEmpty()) {
			req.setAttribute("error", "Đã xảy ra lỗi khi nhập trang sửa đổi thông tin sách, vui lòng thử lại!");
			req.getRequestDispatcher("error.jsp").forward(req, resp);
		} else {
			req.setAttribute("bcfs", bcfs);
			req.setAttribute("btfs", btfs);
			req.setAttribute("pfs", pfs);

			//	2. Chuyển hướng đến giao diện thêm sách book_add.jsp
			req.getRequestDispatcher("book_add.jsp").forward(req, resp);
		}

	}

	private void bookAdd(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int result = 0;
		BookForm bookForm = new BookForm();
		HttpSession hs = req.getSession();
		String date = TimeUtil.getDate();

		bookForm.setBookBarcode(req.getParameter("barcode"));
		bookForm.setBookName(req.getParameter("bookName"));
		bookForm.setBookTypeId(Integer.valueOf(req.getParameter("typeId")));
		bookForm.setAuthor(req.getParameter("author"));
		bookForm.setTranslator(req.getParameter("translator"));
		bookForm.setIsbn((req.getParameter("isbn")));
		bookForm.setPrice(Double.valueOf(req.getParameter("price")));
		bookForm.setPage(Integer.valueOf(req.getParameter("page")));
		bookForm.setBookcaseId(Integer.valueOf(req.getParameter("bookcaseid")));
		bookForm.setOperator((String) hs.getAttribute("username"));
		bookForm.setIntime(date);

//		3.1.3 Gọi insert(bookForm)
//		3.1.8 return kết quả insert thông tin sách
		result = bookDao.insert(bookForm);

		if (result == 0) {
//		3.1.9 Chuyển hướng đến trang error.jsp hiển thị thông báo thêm sách lỗi
			req.setAttribute("error", "Có lỗi trong quá trình thêm sách！");
			req.getRequestDispatcher("error.jsp").forward(req, resp);
		} else if (result == -1) {
//		3.1.9 Chuyển hướng đến trang error.jsp hiển thị thông báo thêm sách lỗi
			req.setAttribute("error", "Barcode không được trùng！");
			req.getRequestDispatcher("error.jsp").forward(req, resp);
		} else {
//			3.1.10 Chuyển hướng đến trang book_ok.jsp hiển thị thông báo thêm sách thành công
			req.getRequestDispatcher("book_ok.jsp?para=1").forward(req, resp);
		}
	}

}
