import 'package:nest_ui/nest_ui.dart';
import 'dart:html';

class Button extends Component {
  List native_events = ["click"];
  Button() {
    event_handlers.add(role: #self, event: 'click', handler: (self) => disappear());
    print(event_handlers.map);
  }

  disappear() {
    dom_element.style..opacity=0; 
  }
}

main() {
  var button = new Button();
  button.dom_element = querySelector("button");
}
