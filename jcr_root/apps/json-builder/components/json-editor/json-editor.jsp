<%@page session="false"%>
<%@include file="/libs/foundation/global.jsp"%>

<div class="col-md-12">
    <h2><%=currentPage.getTitle() %></h2>
    <!-- Nav tabs -->
    <br>
    <span id="validate" class="label">Default</span>
	<br>
    <br>
    <ul class="nav nav-tabs">
        <li role="presentation" class="active"><a href="#home" aria-controls="home" role="tab" data-toggle="tab">Editor</a></li>
        <li role="presentation"><a href="#json" aria-controls="json" data-toggle="tab">JSON</a></li>
        <li role="presentation"><a href="#json-schema" aria-controls="messages" role="tab" data-toggle="tab">Schema</a></li>
    </ul>

    <!-- Tab panes -->
    <div class="tab-content">
        <div role="tabpanel" class="tab-pane active" id="home">
            <div class='col-md-12'>
                <br>
                <div id="action-bar" class="btn-group btn-group-justified" role="group" aria-label="...">
                  <div class="btn-group" role="group">
                    <button type="button" id="save" class="btn btn-success">Save</button>
                  </div>
                  <div class="btn-group" role="group">
                      <label class="btn btn-warning btn-file"> Import JSON
                          <input type="file" id="importJson" name="file" enctype="multipart/form-data" style="display: none;"/>
                      </label>                      
                  </div> 
                  <div class="btn-group" role="group">
                    <a href="#" id="export" class="btn btn-primary">Export JSON</a>
                  </div>                     
                </div>                 
                <div id='editor'></div>              
            </div>
        </div>

        <div role="tabpanel" class="tab-pane" id="json">
            <div class='span8 col-md-12 columns four large-4'>
				<br>
                <textarea id='output' style='width: 100%; height: 300px; font-family: monospace;' class='form-control'></textarea>
				<br>
                <p>You can also make changes to the JSON here and set the value in the editor by clicking 
                <button class='btn btn-primary' id='setvalue'>Update Form</button></p>
                <!--
                <h2>Options</h2>
                <div id='options_holder'>
                    <div>
                        <label>Boolean options</label>
                        <select multiple size=9 id='boolean_options' style='width: 100%;' class='form-control'>
                            <option value='required_by_default'>Object properties required by default</option>
                            <option value='display_required_only'>Only show required properties by default</option>
                            <option value='no_additional_properties'>No additional object properties</option>
                            <option value='ajax'>Allow loading schemas via Ajax</option>
                            <option value='disable_edit_json'>Disable "Edit JSON" buttons</option>
                            <option value='disable_collapse'>Disable collapse buttons</option>
                            <option value='disable_properties'>Disable properties buttons</option>
                            <option value='disable_array_add'>Disable array add buttons</option>
                            <option value='disable_array_reorder'>Disable array move buttons</option>
                            <option value='disable_array_delete'>Disable array delete buttons</option>
                            <option value='disable_array_delete_all_rows'>Disable array delete all rows buttons</option>
                            <option value='disable_array_delete_last_row'>Disable array delete last row buttons</option>
                        </select>
                    </div>
                </div>

                <h2>Validation</h2>
                <p>This will update whenever the form changes to show validation errors if there are any.</p>
                <textarea id='validate'  style='width: 100%; height: 100px; font-family: monospace;' class='form-control'></textarea>
				-->
            </div>
        </div>
        <div role="tabpanel" class="tab-pane" id="json-schema">
            <br>
            <div class='span8 col-md-12'>
                <textarea id='schema' disabled='disabled' style='min-width: 100%; height: 450px; font-family: monospace;' class='form-control'></textarea>
            </div>
        </div>
    </div>

</div>

<cq:include script="client-side.js.jsp"/>