const notifications = await Service.import("notifications");

function Notifications() {
  const popups = notifications.bind("popups");
  return Widget.Box({
    class_name: "notifications",
    visible: popups.as((p) => p.length > 0),
    children: [
      Widget.Icon({
        icon: "preferences-system-notification-symbolic",
      }),
      Widget.Label({
        label: popups.as((p) => p[0]?.summary || ""),
      }),
    ],
  });
}

export default Notifications();
