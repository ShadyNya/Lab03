lgi = require 'lgi' -- подключение модуля lgi

gtk = lgi.Gtk
gtk.init() -- инициализация библиотеки gtk

bld = gtk.Builder() -- создание нового экземпляра построителя интерфейсов
bld:add_from_file('Lab03_Studentova.glade') -- загрузка описания интерфейса



ui = bld.objects


opt = {ui.opt_a, ui.opt_b, ui.opt_c, ui.opt_d}



function update()
	x = 0
	y = 0
	if ui.ckt_x.active == true then x = 1 end
	if ui.ckt_y.active == true then y = 1 end

	v = x + y * 2
	opt[v + 1].active = true
	
	ui.lab_val.label = v
end

function ui.ckt_x:on_clicked(...)
	update()
end

function ui.ckt_y:on_clicked(...)
	update()
end
ui.wnd.title = 'Lab03_StDm' -- задание названия главного 
ui.wnd.on_destroy = gtk.main_quit
ui.wnd:show_all()
gtk.main()
