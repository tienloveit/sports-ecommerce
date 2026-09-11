<%@page contentType="text/html" pageEncoding="UTF-8" %>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
		<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
			<!-- Start Header Area -->
			<jsp:include page="../layout/header.jsp" />
			<!-- End Header Area -->

			<!--================Login Box Area =================-->
			<section class="login_box_area section_gap">
				<div class="container">
					<div class="row align-items-stretch">
						<!-- Bên trái: Ảnh + hover CTA -->
						<div class="col-lg-6">
							<div class="login_box_img" style="height:100%; min-height:520px; overflow:hidden; border-radius:16px 0 0 16px;">
								<img class="img-fluid" src="/client/img/login.jpg" alt="Login background"
									style="width:100%; height:100%; object-fit:cover; display:block;">
								<div class="hover">
									<!-- Logo/Brand badge -->
									<div style="display:inline-block; background:rgba(255,186,0,0.15); border:1.5px solid rgba(255,186,0,0.5); border-radius:50px; padding:6px 18px; margin-bottom:20px;">
										<span style="color:#ffba00; font-size:13px; font-weight:600; letter-spacing:1px; text-transform:uppercase;">⚽ SportShop</span>
									</div>
									<h4 style="font-size:26px; font-weight:700; line-height:1.3; margin-bottom:12px;">
										Chưa có tài khoản?
									</h4>
									<p style="font-size:14.5px; opacity:0.85; line-height:1.7; max-width:340px; margin:0 auto 28px;">
										Đăng ký ngay để trải nghiệm mua sắm thể thao đỉnh cao với hàng nghìn sản phẩm chính hãng
									</p>
									<a class="primary-btn" href="/register"
										style="border-radius:4px; padding:0 32px; font-size:13px; letter-spacing:0.5px;">
										Tạo tài khoản
									</a>
								</div>
							</div>
						</div>

						<!-- Bên phải: Form đăng nhập -->
						<div class="col-lg-6">
							<div class="login_form_inner" style="
								height:100%;
								min-height:520px;
								padding: 60px 50px;
								text-align:left;
								border-radius:0 16px 16px 0;
								box-shadow: 0 20px 60px rgba(0,0,0,0.08);
								display:flex;
								flex-direction:column;
								justify-content:center;
							">
								<!-- Tiêu đề -->
								<div class="mb-4">
									<h3 style="font-size:26px; font-weight:700; color:#222; text-transform:none; margin-bottom:6px;">
										Chào mừng trở lại 👋
									</h3>
									<p style="color:#888; font-size:14px; margin-bottom:0;">
										Đăng nhập để tiếp tục mua sắm
									</p>
								</div>

								<!-- Thông báo lỗi -->
								<c:if test="${param.error != null}">
									<div style="
										background:#fff5f5;
										border:1px solid #fed7d7;
										border-left:4px solid #fc8181;
										border-radius:8px;
										padding:12px 16px;
										margin-bottom:20px;
										display:flex;
										align-items:center;
										gap:10px;
									">
										<span style="font-size:18px;">⚠️</span>
										<div>
											<p style="margin:0; font-size:13.5px; font-weight:600; color:#c53030;">Đăng nhập thất bại!</p>
											<p style="margin:0; font-size:13px; color:#742a2a;">Tài khoản hoặc mật khẩu không chính xác.</p>
										</div>
									</div>
								</c:if>

								<!-- Form -->
								<form class="row login_form" action="/login" method="post" id="contactForm" novalidate="novalidate">
									<!-- Username -->
									<div class="col-md-12 form-group mb-3">
										<label style="font-size:13px; font-weight:600; color:#444; margin-bottom:6px; display:block;">
											Tên đăng nhập
										</label>
										<div style="position:relative;">
											<span style="position:absolute; left:14px; top:50%; transform:translateY(-50%); color:#aaa; font-size:15px;">
												<i class="fa fa-user"></i>
											</span>
											<input type="text" class="form-control" name="username"
												placeholder="Nhập tài khoản của bạn"
												style="
													height:48px;
													border:1.5px solid #e2e8f0;
													border-radius:10px;
													padding-left:42px;
													font-size:14px;
													color:#333;
													background:#f8fafc;
													transition:all .2s;
												"
												onfocus="this.style.borderColor='#ffba00'; this.style.background='#fff'; this.style.boxShadow='0 0 0 3px rgba(255,186,0,0.12)';"
												onblur="this.style.borderColor='#e2e8f0'; this.style.background='#f8fafc'; this.style.boxShadow='none';"
											>
										</div>
									</div>

									<!-- Password -->
									<div class="col-md-12 form-group mb-3">
										<label style="font-size:13px; font-weight:600; color:#444; margin-bottom:6px; display:block;">
											Mật khẩu
										</label>
										<div style="position:relative;">
											<span style="position:absolute; left:14px; top:50%; transform:translateY(-50%); color:#aaa; font-size:15px;">
												<i class="fa fa-lock"></i>
											</span>
											<input type="password" id="passwordInput" class="form-control" name="password"
												placeholder="Nhập mật khẩu"
												style="
													height:48px;
													border:1.5px solid #e2e8f0;
													border-radius:10px;
													padding-left:42px;
													padding-right:42px;
													font-size:14px;
													color:#333;
													background:#f8fafc;
													transition:all .2s;
												"
												onfocus="this.style.borderColor='#ffba00'; this.style.background='#fff'; this.style.boxShadow='0 0 0 3px rgba(255,186,0,0.12)';"
												onblur="this.style.borderColor='#e2e8f0'; this.style.background='#f8fafc'; this.style.boxShadow='none';"
											>
											<!-- Toggle password visibility -->
											<button type="button" onclick="togglePassword()" tabindex="-1"
												style="position:absolute; right:14px; top:50%; transform:translateY(-50%); background:none; border:none; color:#aaa; cursor:pointer; padding:0; font-size:15px;"
												id="togglePwdBtn">
												<i class="fa fa-eye" id="eyeIcon"></i>
											</button>
										</div>
									</div>

									<!-- CSRF -->
									<div>
										<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
									</div>

									<!-- Nút đăng nhập -->
									<div class="col-md-12 form-group mt-2">
										<button type="submit" class="primary-btn"
											style="
												width:100%;
												height:48px;
												border-radius:10px;
												font-size:14px;
												font-weight:600;
												letter-spacing:0.3px;
												border:none;
												cursor:pointer;
											">
											Đăng nhập
										</button>
									</div>

									<!-- Link đăng ký -->
									<div class="col-md-12 text-center mt-3">
										<p style="font-size:13.5px; color:#888; margin:0;">
											Chưa có tài khoản?
											<a href="/register" style="color:#ffba00; font-weight:600; text-decoration:none;"
												onmouseover="this.style.textDecoration='underline';"
												onmouseout="this.style.textDecoration='none';">
												Đăng ký ngay
											</a>
										</p>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
			</section>
			<!--================End Login Box Area =================-->

			<script>
				function togglePassword() {
					var input = document.getElementById('passwordInput');
					var icon = document.getElementById('eyeIcon');
					if (input.type === 'password') {
						input.type = 'text';
						icon.className = 'fa fa-eye-slash';
					} else {
						input.type = 'password';
						icon.className = 'fa fa-eye';
					}
				}
			</script>

			<!-- start footer Area -->
			<jsp:include page="../layout/footer.jsp" />
			<!-- End footer Area -->