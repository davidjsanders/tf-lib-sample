resource "azurerm_virtual_machine_data_disk_attachment" "master-data-disk" {
    depends_on = [
        data.azurerm_managed_disk.data-disk,
        module.vm-masters
    ]
    managed_disk_id    = data.azurerm_managed_disk.data-disk.id
    virtual_machine_id = module.vm-masters.*.vm-ids[0][0]
    lun                = 1
    create_option      = "Attach"
    caching            = "ReadWrite"
}