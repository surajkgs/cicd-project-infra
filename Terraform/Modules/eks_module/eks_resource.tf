resource "aws_eks_cluster" "eks_resource" {
  name = var.eks_cluster_name_var

  version = var.k8s_version_var
  

  role_arn = aws_iam_role.iam_role_cluster_resource.arn

  vpc_config {
    endpoint_public_access = true
    // security_group_ids = [data.aws_security_group.cluster.id]
    subnet_ids         = var.subnet_ids_var
  }

  // enabled_cluster_log_types = var.eks-cw-logging

  depends_on = [
    aws_iam_role_policy_attachment.cluster-AmazonEKSClusterPolicy,
    aws_iam_role_policy_attachment.cluster-AmazonEKSServicePolicy,
  ]
}
output "endpoint" {
  value = aws_eks_cluster.eks_resource.endpoint
}

resource "aws_eks_node_group" "eks-node-group" {
  cluster_name    = var.eks_cluster_name_var
  node_group_name = "${var.eks_cluster_name_var}-default-node-group"
  node_role_arn   = aws_iam_role.node.arn
  subnet_ids      = var.subnet_ids_var
  scaling_config {
    desired_size = 2
    max_size     = 2
    min_size     = 2
  }
  instance_types = [
    var.node_instance_type_var
  ]
  # Ensure that IAM Role permissions are created before and deleted after EKS Node Group handling.
  # Otherwise, EKS will not be able to properly delete EC2 Instances and Elastic Network Interfaces.
  depends_on = [
    aws_eks_cluster.eks_resource,
    aws_iam_role_policy_attachment.node-AmazonEKSWorkerNodePolicy,
    aws_iam_role_policy_attachment.node-AmazonEKS_CNI_Policy
  ]
  tags = {
    Name = "${var.eks_cluster_name_var}-default-node-group"
  }
}