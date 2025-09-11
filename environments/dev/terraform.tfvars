# Cluster name
cluster_name = "cluster-3"

# Choose a domain which you can administer, including creating DNS records.
base_domain = "giba.tech"

# Optional: Restrict SSH access (default: ["0.0.0.0/0"])
# allowed_ssh_cidr_blocks = ["203.0.113.0/24", "198.51.100.0/24"]

# Optional: Enable automatic reboots after updates (default: false)
automatic_reboot = true

# Optional: UTC time for automatic reboots (default: "05:00")
# automatic_reboot_time_utc = "05:00"

# Optional: Number of managers (default: 3, allowed: 1 or 3)
manager_count = 1

# Workers configuration
workers = {
  # Workers for traefik stack
  "traefik" = {
    plan         = "medium",
    data_size_gb = 10
  },

  # Workers for monitoring stack
  "monitoring" = {
    plan         = "large",
    data_size_gb = 100
  },

  # Workers for nextcloud-postgres-redis stack
  "nextcloud" = {
    plan         = "small",
    data_size_gb = 20,
  },
  "postgres" = {
    plan         = "small",
    data_size_gb = 20
  },
  "redis" = {
    plan         = "micro",
    data_size_gb = 10
  }

  # Workers for wordpress-mysql stack
  # "wp" = {
  #   plan         = "large",
  #   data_size_gb = 120,
  # },
  # "mysql" = {
  #   plan         = "large",
  #   data_size_gb = 90
  # }
}

# Public IPs and load balancer configuration
public_ips = {
  traefik = {
    ports = [
      {
        public        = 80
        private       = 80
        protocol      = "tcp-proxy"
        allowed_cidrs = ["0.0.0.0/0"]
      },
      {
        public        = 443
        private       = 443
        protocol      = "tcp-proxy"
        allowed_cidrs = ["0.0.0.0/0"]
      }
    ]
  }
}