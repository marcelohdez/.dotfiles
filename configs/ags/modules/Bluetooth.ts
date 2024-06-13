const bluetooth = await Service.import("bluetooth");

function Bluetooth() {
  return Widget.Icon({
    icon: bluetooth
      .bind("enabled")
      .as((on) => `bluetooth-${on ? "active" : "disabled"}-symbolic`),
  });
}

export default Bluetooth();
