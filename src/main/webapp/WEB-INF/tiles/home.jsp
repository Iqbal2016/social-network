<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<c:set var="searchUrl" value="/search" />

<%-- <div class="row status-row">
	<div class="col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2">
		<div class="homepage-status">${statusUpdate.text}</div>
	</div>
</div> --%>
<sec:authorize access="isAuthenticated()">
<div class="row">

		<%-- <form method="post" action="${searchUrl }">
			<input type="hidden" name="${_csrf.parameterName }"
				value="${_csrf.token }"> --%>


				<!-- <input type="text" class="form-control" name="s"
					placeHolder="Search Hobbies"> <span class="input-group-btn">
					<button id="search-button" class="btn btn-primary" type=submit>
						Find People</button>
				</span> -->
				<div class="row">
					<div class="col-md-3">
						 <div class="panel panel-default">
			                    <div class="panel-heading">
			                        <i class="fa fa-group"></i> Friends
			                    </div>
			
			                    <div id="box-lista-amigos" class="panel-body">
			                        <!-- List of friends here made by JavaScript-->
			                    </div>
			
			              </div>

		                <div class="panel panel-default">
		                    <div class="panel-heading">
		                        <i class="fa fa-envelope-o"></i> Friendship invitations</div>
		
		                    <div id="box-listagem-convites" class="panel-body">
		                        <!-- Here the list of invitations will be rendered by JavaScript -->
		                    </div>
		
		                </div>
					</div>
					<div class="col-md-6">

			                <article class="panel panel-default">
			                    <section class="panel-body">
			
			                        <form:form method="post" modelAttribute="addstatus" >
										<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">
			                            <article class="form-group">
			                                <textarea id="txt-post" maxlength="254" name="message" required="required" class="form-control post-campo" rows="3" cols="40" placeholder="What are you thinking about?"></textarea>
			                            </article>
			
			                            <spam id="upload-file-content" class="col-md-4 col-xs-4 no-padding">
			                                <!-- Btn will be rendered here for image upload via JS / AJAX -->
			                            </spam>
			                            <button type="submit" id="btn-postar" disableed="false" class="btn btn-success pull-right btn-active-loading" name="button">
			                                <spam id="txt-button">
			                                    <i class="fa fa-paper-plane-o" style="font-size:18px"></i>
			                                    To post
			                                </spam>
			                            </button>
			                        </form:form> 
			
			                    </section>
			                </article>

	                	<section class="panel panel-default">
		                    <article class="panel-heading">
		                        <i class="fa fa-commenting-o"></i> Posts
		                        <a id="btn-refresh-posts" class="btn-post-refresh link-style cursor-pointer"> 
		                            <i class="pull-right fa fa-refresh" aria-hidden="true"></i>
		                        </a>
		                    </article>
		
		                    <article id="box-posts">
		                       
								<div class="profile-about">
																		
									 <c:forEach items="${profile}" var="profile">
									    <tr>      
									        <td><h2>${profile.user.firstname}</h2></td>
									        <td>${profile.about}</td> 
									        <td>${profile.photoName}</td>
									    </tr>
									     <tr>      
									        <td><a href="#">Edit |</a></td>
									        <td><a href="#">| Delete</a></td> 
									    </tr>
									</c:forEach>
						
								</div>
								
						
						
								<c:url value="/upload-profile-photo" var="uploadPhotoLink" />
								<form method="post" enctype="multipart/form-data" id="photoUploadForm"
									action="${uploadPhotoLink}">
						
									<input type="file" accept="image/*" name="file" id=photoFileInput />
									<input type="submit" value="upload" /> <input type="hidden"
										name="${_csrf.parameterName }" value="${_csrf.token }">
								</form>
								
		                    </article>
	            		</section>						
					</div>
					<div class="col-md-3">
						<section class="panel panel-default">
		                    <article class="panel-heading">
		                        <i class="fa fa-futbol-o" aria-hidden="true"></i> 
		                        Games around
		
		                    </article>
		
		                    <section class="panel-body">
		                        <article id="box-jogos">
		                            <!-- Here the game scores will be inserted -->
		                        </article>
		                    </section>
		
		                </section>
					</div>
				</div>

		<!-- </form> -->
</sec:authorize>
</div>