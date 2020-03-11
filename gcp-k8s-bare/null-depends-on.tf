resource "null_resource" "null-depends-on" {
    triggers = {
        master-vm-1 = module.vm-master.self-link[0]
        data-disks  = join(",", google_compute_disk.datadisk.*.id)
    }
}