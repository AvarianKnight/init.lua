return {
  "snacks.nvim",
  keys = {
    { "<leader>n", false },
    { "<leader>sn", function() Snacks.notifier.show_history() end, desc = "Notification History" },
    { "<leader>un", function() Snacks.notifier.hide() end, desc = "Dismiss All Notifications" },
  },
}
