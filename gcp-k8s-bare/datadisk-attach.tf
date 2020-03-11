resource "google_compute_attached_disk" "datadisk-attach" {
    count = length(var.datadisk)

    depends_on = [
        google_compute_disk.datadisk,
        null_resource.null-depends-on
    ]

    disk     = google_compute_disk.datadisk.*.self_link[count.index]
    instance = module.vm-master.self-link[0]
}