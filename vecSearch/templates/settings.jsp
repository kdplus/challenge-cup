<%--
  Created by IntelliJ IDEA.
  User: 滩涂上的芦苇
  Date: 2016/8/23
  Time: 12:33
  To change this template use File | Settings | File Templates.
--%>
<div tabindex="-1" class="fade modal" id="accountSettings" role="dialog" style="display: none;">
    <div class="modal-dialog">
        <div class="modal-content" role="document">
            <div class="modal-header">
                <button class="close" aria-label="Close" type="button" data-dismiss="modal">
                    <span aria-hidden="true">×</span>
                </button>
                <h4 class="modal-title">My Account</h4>
            </div>
            <div class="clearfix modal-body">
                <div class="col-sm-12 ">
                    <form class="stream-form" method="post" action="changePassword.action" data-target="#accountSettings" data-form="/dashboard/api/user/">
                        <div id="my-account-tabs">
                            <ul class="nav nav-tabs nav-tabs-mktg" role="tablist">
                                <li class="active" role="presentation">
                                    <a tabindex="0" id="my-account-tabs___tab___1" role="tab" aria-expanded="true" aria-selected="true" aria-controls="my-account-tabs___pane___1" href="#my-account-tabs___pane___1" data-toggle="tab">Profile</a>
                                </li>
                                <li class="" role="presentation">
                                    <a tabindex="-1" id="my-account-tabs___tab___2" role="tab" aria-expanded="true" aria-selected="false" aria-controls="my-account-tabs___pane___2" href="#my-account-tabs___pane___2" data-toggle="tab">Password</a>
                                </li>
                            </ul>
                            <div class="tab-content">
                                <div class="tab-pane fade active in" id="my-account-tabs___pane___1" role="tabpanel" aria-hidden="false" aria-labelledby="my-account-tabs___tab___1">

                                    <div class="form-group">
                                        <label class="stream-form-label">UserName</label>
                                        <input name="userName" class="stream-form-control null" value="">
                                        <span></span>
                                    </div>
                                </div>
                                <div class="tab-pane fade" id="my-account-tabs___pane___2" role="tabpanel" aria-hidden="true" aria-labelledby="my-account-tabs___tab___2">
                                    <div class="form-group">
                                        <label class="stream-form-label">Old Password</label>
                                        <input name="oldPassword" class="stream-form-control null" type="password">
                                        <span></span>
                                    </div>
                                    <div class="form-group">
                                        <label class="stream-form-label">New Password</label>
                                        <input name="password" class="stream-form-control null" type="password">
                                        <span></span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="clearfix breath-md">
                            <button class="btn-stream btn-stream-primary btn-stream-md pull-right" type="submit">Submit</button>
                            <button class="btn-stream btn-stream-link-default btn-stream-md pull-right" type="button" data-dismiss="modal">Cancel</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
