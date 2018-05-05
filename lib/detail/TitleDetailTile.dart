import 'package:flutter/material.dart';

class TitleDetailTile extends StatelessWidget {

  TitleDetailTile({ this.completed, this.update_completed, this.title, this.update_title });

  final bool completed ;
  final ValueChanged<bool> update_completed ;

  final String title ;
  final ValueChanged<String> update_title ;

  Widget getStatusIcon( bool completed, context ){

    return completed ?
    new CircleAvatar( child: new Icon( Icons.check, color: Colors.white, size: 14.0, ),
      backgroundColor: Theme.of(context).primaryColor,
      radius: 12.0, ) :
    new Icon( Icons.radio_button_unchecked, size: 28.0, color: Theme.of(context).primaryColor, );

  }

  @override
  Widget build(BuildContext context) {

    return new ListTile(

      leading: new IconButton(
        icon:  getStatusIcon( this.completed, context ),
        onPressed: (){
          this.completed ? this.update_completed( false ): this.update_completed( true );
        },
      ),

      title: new TextField(

        controller: new TextEditingController( text: this.title ),

        onSubmitted: (value) => update_title( value ),
        //onChanged: (value) => update_title( value ),

        style: new TextStyle( fontSize: 24.0, color: Theme.of(context).primaryColor ),

        decoration: new InputDecoration(

          border: InputBorder.none,

          hintText: 'Enter Title',
          hintStyle: new TextStyle( fontSize: 24.0, color: Colors.grey ),

          labelText: 'Title',
          labelStyle: new TextStyle( fontSize: 18.0, color: Colors.grey ),

        ),

      ),

      trailing: new IconButton(
        icon:  new Icon( Icons.clear, color: this.title == null ? Colors.white : Theme.of(context).primaryColor, ),
        onPressed: () => update_title( null ),
      ),

    );
  }

}