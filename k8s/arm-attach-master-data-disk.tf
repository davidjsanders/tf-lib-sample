resource "azurerm_virtual_machine_data_disk_attachment" "attach-master-disk" {
  managed_disk_id    = data.azurerm_managed_disk.master-data-disk.id
  virtual_machine_id = module.srv-master.vm-ids[0]
  lun                = "1"
  caching            = "ReadWrite"
}