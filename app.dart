import 'package:nest_ui/nest_ui.dart';
import 'dart:html';

class ButtonComponentBehaviors {

  Component component;

  ButtonComponentBehaviors() {}

  clicked_caption_toggle() {
    if(this.component.attributes['caption'] == 'Click me!')
      this.component.caption = 'Clicked!';
    else
      this.component.caption = 'Click me!';
  }

}

class Button extends Component {
  final List attribute_names = ["caption"];
  List native_events   = ["click"];
  List behaviors  = [ButtonComponentBehaviors];
  Button() : super() { // we might not need that call to super(), not sure yet
    event_handlers.add(event: 'click', handler: (self) => behave('clicked_caption_toggle'));
  }

}

main() {
  var button = new Button();
  button.dom_element = querySelector("button");
  print(button.caption);
}
