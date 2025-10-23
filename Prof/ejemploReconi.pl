
:-use_module(library(pce)).

main :-
	new(P,window('Hola paisanos',size(200,100))), %letrero
	send(P,display,
	     new(Text,text('Compren en Soriana',
	          center,font(times,bold,18))),point(200,20)), %tamaño de la fuente
	send(Text,recogniser,new(move_gesture(left,c))),

    send(P,display, new(B,box(130,130)),point(200,120)), %modificar la caja...
    %send(B,fillpattern,red),
	send(B,recogniser,new(move_gesture(left,c))),

        send(P,display, new(B1,box(130,130)),point(20,120)), %modificar la caja...
    %send(B,fillpattern,red),
	send(B1,recogniser,new(move_gesture(left,c))),
    send(B1,fill_pattern,colour(blue)),
    
        send(P,display, new(B2,box(150,130)),point(50,120)), %modificar la caja...
    %send(B,fillpattern,red),
	send(B2,recogniser,new(move_gesture(left,c))),

        send(P,display, new(B3,box(150,130)),point(40,120)), %modificar la caja...
    %send(B,fillpattern,red),
	send(B3,recogniser,new(move_gesture(left,c))),

        send(P,display, new(C,circle(150)),point(40,80)), %modificar la caja...
    %send(B,fillpattern,red),
    send(C,recogniser,new(move_gesture(left,c))),
    send(C,fill_pattern,colour(green)),

            send(P,display, new(C1,circle(120)),point(140,120)), %modificar la caja...
    send(C1,fill_pattern,black),
	send(C1,recogniser,new(move_gesture(left,c))),

                send(P,display, new(C2,circle(20)),point(140,120)), %modificar la caja...
    send(C2,fill_pattern,black),
	send(C2,recogniser,new(move_gesture(left,c))),

    send(P,open).
