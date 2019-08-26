// App.js
import React, { Component } from "react";
import { View, Text } from "react-native";

export default class App extends Component {
  render() {
    return (
      <View style={{ flex: 1, backgroundColor: "red" }}>
        <Text style={{ fontSize: 14, paddingTop: 150 }}>
          Essa é uma tela do react native garaio
        </Text>
      </View>
    );
  }
}
