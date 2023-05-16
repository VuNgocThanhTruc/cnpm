package com.xxbb.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.xxbb.actionform.ManagerForm;
import com.xxbb.dao.ManagerDao;
import com.xxbb.dao.impl.ManagerDaoImpl;
import com.xxbb.util.StrUtil;

/**
 * Servlet implementation class ManagerSerlvet
 */
@WebServlet(urlPatterns = "/manager")
public class ManagerSerlvet extends HttpServlet {
	// để kiểm soát phiên bản
	private static final long serialVersionUID = 1L;
	private ManagerDao md = null;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ManagerSerlvet() {
		md = new ManagerDaoImpl();
	}

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		resp.setContentType("text/html; charset=utf-8");
		String action = req.getParameter("action");
		if (action == null || "".equals(action)) {
			req.getRequestDispatcher("error.jsp").forward(req, resp);
		} else if ("login".equals(action)) {
			managerLogin(req, resp);
		} else if ("managerQuery".equals(action)) {
			managerQuery(req, resp);
		} else if ("managerAdd".equals(action)) {
			managerAdd(req, resp);
		} else if ("managerModifyQuery".equals(action)) {
			managerModifyQuery(req, resp);
		} else if ("managerModify".equals(action)) {
			managerModify(req, resp);
		} else if ("managerDelete".equals(action)) {
			managerDelete(req, resp);
		}else if("pwdquery".equals(action)) {
			pwdQuery(req,resp);
		}else if("pwdmodify".equals(action)) {
			pwdModify(req,resp);
		}
	}
	/**
	 * 
	    * @Title: pwdModify
	    * @Description: TODO()
	    * @param req
	    * @param resp
	    * @throws ServletException
	    * @throws IOException
	    * @return void
	 */
	private void pwdModify(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//lấy username và password
		String name=req.getParameter("name");
		String password=req.getParameter("pwd");
		
		//chuyển thông tin user
		ManagerForm mgf=new ManagerForm();
		mgf.setName(name);
		mgf.setPwd(password);
		
		//update kết quả
		int result=md.updatePassword(mgf);
		if(result==1) {
			req.getRequestDispatcher("/pwd_ok.jsp").forward(req, resp);
		}else {
			req.setAttribute("error", "Sửa đổi mật khẩu không thành công, vui lòng thử lại！");
			req.getRequestDispatcher("/error.jsp").forward(req, resp);
		}
		
	}
	
	/**
	 * 
	    * @Title: pwdquery
	    * @Description: TODO()
	    * @param req
	    * @param resp
	    * @throws ServletException
	    * @throws IOException
	    * @return void
	 */
	private void pwdQuery(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//lấy username
		HttpSession hs=req.getSession();
		String userName=(String) hs.getAttribute("username");
		ManagerForm mgf=new ManagerForm();
		mgf.setName(userName);
		List<ManagerForm> mgfs=md.query(mgf);
		if(!mgfs.isEmpty()) {
			req.setAttribute("manager", mgfs.get(0));
			req.getRequestDispatcher("/pwd_Modify.jsp").forward(req, resp);
		}else{
			req.setAttribute("error", "Lỗi hệ thống, vui lòng thử lại!");
			req.getRequestDispatcher("/error.jsp").forward(req, resp);
		}
		
	}
	/**
	 * HLinh
	 * 	usecase Login
	 * 	B3.2: ktra username và password có trùng khớp với db
	 * @Title: managerLogin
	 * @Description: TODO
	 * @param req
	 * @param resp
	 * @throws ServletException
	 * @throws IOException
	 * @return void
	 */
	private void managerLogin(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		// Lấy dữ liệu và lọc kí tự đặc biệt
		ManagerForm mgf = new ManagerForm();
		mgf.setName(StrUtil.filterStr(req.getParameter("name")));
		mgf.setPwd(StrUtil.filterStr(req.getParameter("pwd")));
		System.out.println("Bắt đầu xác minh đăng nhập！！！");
		boolean flag = md.checkManager(mgf);
		if (flag) {
			// Lưu thông tin đăng nhập của user
			HttpSession s = req.getSession();
			s.setAttribute("username", mgf.getName());
			//B3.2.1: trùng khớp, trả về trang chủ main.jsp
			req.getRequestDispatcher("/main.jsp").forward(req, resp);
		} else {
			//B3.2.2: không trùng khớp, chuyển đến trang lỗi error.jsp
			req.setAttribute("error", "Tên đăng nhập hoặc mật khẩu không đúng");
			req.getRequestDispatcher("/error.jsp").forward(req, resp);
		}
	}

	/**
	 * 
	 * @Title: managerQuery
	 * @Description: TODO()
	 * @param req
	 * @param resp
	 * @throws ServletException
	 * @throws IOException
	 * @return void
	 */
	private void managerQuery(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		// lấy dữ liệu và lọc kí tự đặc biệt
		ManagerForm mgf = new ManagerForm();
		System.out.println("Bắt ầu truy vấn quản trị viên！！！");
		// truy vấn và chuyển giá trị
		req.setAttribute("managers", md.query(mgf));
		req.getRequestDispatcher("manager.jsp").forward(req, resp);
	}

	/**
	 * 
	 * @Title: managerAdd
	 * @Description: TODO()
	 * @param req
	 * @param resp
	 * @throws ServletException
	 * @throws IOException
	 * @return void
	 */
	private void managerAdd(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		// Lấy dữ liệu và lọc ký tự nguy hiểm
		System.out.println("Bắt đầu thêm quản trị viên！！！");
		ManagerForm mgf = new ManagerForm();
		mgf.setName(StrUtil.filterStr(req.getParameter("name")));
		mgf.setPwd(StrUtil.filterStr(req.getParameter("pwd")));
		int result = md.insert(mgf);
		if (result == 1) {
			// Chuyển đến trang thành công đã thêm thông tin quản trị viên
			req.getRequestDispatcher("manager_ok.jsp?para=1").forward(req, resp);
		} else if (result == -1) {
			// Lưu thông báo lỗi vào tham số lỗi
			// Chuyển đến trang lỗi
			req.setAttribute("error", "Thông tin quản trị viên đã tồn tại！！！");
			req.getRequestDispatcher("error.jsp").forward(req, resp);
		} else if (result == 0) {
			// Lưu thông báo lỗi vào tham số lỗi
			// Chuyển đến trang lỗi
			req.setAttribute("error", "Không thể thêm thông tin quản trị viên！");
			req.getRequestDispatcher("error.jsp").forward(req, resp);
		}

		// Truy vấn và chuyển giá trị
		ManagerForm m = new ManagerForm();
		req.setAttribute("managers", md.query(m));
		req.getRequestDispatcher("manager.jsp").forward(req, resp);
	}

	private void managerModifyQuery(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		// Lấy dữ liệu và lọc ký tự đặc biệt
		System.out.println("Bắt đầu thao tác truy vấn quyền！！！");
		ManagerForm mgf = new ManagerForm();
		mgf.setId(Integer.valueOf(req.getParameter("id")));
		List<ManagerForm> mgfs = md.query(mgf);
		ManagerForm m = (ManagerForm) mgfs.get(0);
		req.setAttribute("mmq", m);
		req.getRequestDispatcher("/manager_Modify.jsp").forward(req, resp);
	}

	/**
	 * 
	 * @Title: managerModify
	 * @Description: TODO()
	 * @param req
	 * @param resp
	 * @throws ServletException
	 * @throws IOException
	 * @return void
	 */
	private void managerModify(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("Bắt đầu thao tác sửa đổi quyền！！！");
		ManagerForm mgf = new ManagerForm();
		mgf.setId(Integer.parseInt(req.getParameter("id"))); // Nhận và đặt ID quản trị viên
		mgf.setSystemSet(req.getParameter("sysset") == null ? 0 : 1);
		mgf.setReaderSet(req.getParameter("readerset") == null ? 0 : 1);
		mgf.setBookSet(req.getParameter("bookset") == null ? 0 : 1);
		mgf.setBorrowSet(req.getParameter("borrowback") == null ? 0 : 1);
		mgf.setSystemQuery(req.getParameter("sysquery") == null ? 0 : 1);
		int result = md.update(mgf);
		if (result == 1) {
			// Chuyển đến trang thành công cài đặt quyền
			req.getRequestDispatcher("manager_ok.jsp?para=2").forward(req, resp);
		} else {
			req.setAttribute("error", "Không thể đặt đặc quyền của quản trị viên！");
			req.getRequestDispatcher("error.jsp").forward(req, resp); // Chuyển đến trang lỗi
		}

	}
	/**
	 * 
	    * @Title: managerModify
	    * @Description: TODO()
	    * @param req
	    * @param resp
	    * @throws ServletException
	    * @throws IOException
	    * @return void
	 */
	private void managerDelete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("Bắt đầu xóa quản trị viên！！！");
		ManagerForm mgf = new ManagerForm();
		mgf.setId(Integer.parseInt(req.getParameter("id"))); // Nhận và đặt ID quản trị viên
		int result = md.delete(mgf);
		if (result == 1) {
			// Chuyển đến trang thành công cài đặt quyền
			req.getRequestDispatcher("manager_ok.jsp?para=3").forward(req, resp);
		} else {
			req.setAttribute("error", "Xóa quản trị viên cài đặt không thành công！");
			req.getRequestDispatcher("error.jsp").forward(req, resp); // Chuyển đến trang lỗi
		}

	}

}
