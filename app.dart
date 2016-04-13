import 'package:nest_ui/nest_ui.dart';
import 'dart:html';

class Button extends Component {
  List native_events = ["click"];
  Button() {
    event_handlers.add(event: 'click', handler: (self) => disappear());
  }

  disappear() {
    dom_element.style..display="none"; 
  }
}

main() {
  var button = new Button();
  button.dom_element = querySelector("button");
}
