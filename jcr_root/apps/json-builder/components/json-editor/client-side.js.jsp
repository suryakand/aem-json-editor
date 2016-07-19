<%@include file="/libs/foundation/global.jsp"%>

<script>
var path = '<%=resource.getPath() %>';

(function() {
    var schema;

    // Default starting schema
    if(!schema) {
        schema = <cq:text property="schemaDefination"/>;
    }

    // Divs/textareas on the page
    var $schema = document.getElementById('schema');
    var $output = document.getElementById('output');
    var $editor = document.getElementById('editor');
    var $validate = document.getElementById('validate');
    // Buttons
    var $set_value_button = document.getElementById('setvalue');
    var jsoneditor;

    var reload = function(keep_value) {
        var startval = (jsoneditor && keep_value)? jsoneditor.getValue() : window.startval;
        window.startval = undefined;

        if(jsoneditor) jsoneditor.destroy();
        jsoneditor = new JSONEditor($editor,{
            schema: schema,
            startval: startval
        });
        window.jsoneditor = jsoneditor;

        $.ajax({
            type: "GET",
            url: path + '/jsonData.json',
            success: function(data, status, xhr) {
            	$output.value = JSON.stringify(JSON.parse(data.jsonData),null,2);
	            jsoneditor.setValue(JSON.parse($output.value));
        	},
            error: function(data, status) {
            	console.log("Error: " + status);
        	}
    	}); 

        // When the value of the editor changes, update the JSON output and validation message
        jsoneditor.on('change',function() {
            var json = jsoneditor.getValue();
            $output.value = JSON.stringify(json,null,2);
            var validation_errors = jsoneditor.validate();
            // Show validation errors if there are any
            if(validation_errors.length > 0) {
                $($validate).text('JOSN is Invalid');
                $($validate).removeClass('label-success');
                $($validate).addClass('label-danger');      
                $('#action-bar').hide();                
            }
            else {
                $('#action-bar').show();
                $($validate).text('JOSN is Valid');
                $($validate).addClass('label-success');
                $($validate).removeClass('label-danger');
            }
        });
    };

    // Start the schema and output textareas with initial values
    $schema.value = JSON.stringify(schema,null,2);
    $output.value = '';

    // Set options from direct link
    JSONEditor.defaults.options.theme = 'bootstrap3';
    JSONEditor.defaults.options.iconlib = 'bootstrap3';
    JSONEditor.defaults.options.object_layout = 'normal';
    JSONEditor.defaults.options.show_errors = 'always';
    JSONEditor.defaults.options.disable_array_reorder = <%=properties.get("disable_array_reorder", false) %>
    JSONEditor.defaults.options.disable_edit_json = <%=properties.get("disable_edit_json", false) %>

    reload();

    $('#save').click(function() {
        $.ajax({
          type: "POST",
          	url: path,
            data: {'jsonData': $output.value},
            success: function(data, status, xhr) {
                //console.log(data);
                alert('JSON Updated !');
            },
            error: function(data, status) {
                alert('Error while updating JSON!');
                console.log(status);
            },
            dataType: 'json'
        });        
    });

    $('#export').click(function() {
        var dataStr = "data:text/json;charset=utf-8," + encodeURIComponent(JSON.stringify(JSON.parse($output.value)));
        var dlAnchorElem = document.getElementById('downloadAnchorElem');
        $('#export').attr("href", dataStr);
        $('#export').attr("download", "response.json");
    });

    $('#importJson').change( function (evt) {
        var files = evt.target.files;
        var file = files[0];           
        var reader = new FileReader();
        reader.onload = function() {
            $output.value = this.result;    
            jsoneditor.setValue(JSON.parse($output.value));
        }
        reader.readAsText(file)
    });
})();    
</script>