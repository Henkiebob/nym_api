$(function() {
    var max_fields      = 10;
    var wrapper         = $(".users");
    var add_button      = $(".add_field_button");
    var current_count   = 1;

    var x = 1;
    $(add_button).click(function(e){
        e.preventDefault();
        if(x < max_fields){
            x++;
            current_count++;

            var label = $("<label/>");
            label.attr('for', 'house_users_attributes_'+current_count+'_name');
            label.text('Naam');

            var input = $("<input/>");
            input.attr('type', 'text');
            input.attr('id', 'house_users_attributes_'+current_count+'_name');
            input.attr('name', 'house[users_attributes]['+current_count+'][name]');

            var div = $('<div/>');
            div.addClass('field');
            var link = $('<a href="#"/>').addClass('remove_field').text('Verwijderen');

            //<input class="colorpicker" id="house_users_attributes_0_color" name="house[users_attributes][0][color]" type="text">
            // var color_input = $("<input/>");
            // color_input.attr('type', 'text');
            // color_input.attr('id', 'house_users_attributes_'+current_count+'_color');
            // color_input.attr('class', 'colorpicker');
            // color_input.attr('name', 'house[users_attributes]['+current_count+'][color]');

             //<input id="house_users_attributes_1_avatar" name="house[users_attributes][1][avatar]" type="file">

            var file = $('<input/>');
            file.attr('type', 'file');
            file.attr('id', 'house_users_attributes_'+current_count+'_avatar');
            file.attr('name', 'house[users_attributes]['+current_count+'][avatar]');

            div.append(label).append(input).append(link).append(file);

            //color_input.minicolors();

            link.on("click", function(e){
              e.preventDefault();
              $(this).parent('div').remove(); x--;
            });

            $(wrapper).append(div);
        }
    });


    $('.colorpicker').minicolors()
});
